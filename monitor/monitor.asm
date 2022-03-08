
        * = $8000
        
CLOCK_MHZ   = 1         ; // clock frequency in MHz

RAM_END     = $3fff

; 65C51 ACIA
ACIA_BASE   = $7f20
ACIA_DATA   = ACIA_BASE + 0
ACIA_STATUS = ACIA_BASE + 1
ACIA_CMD    = ACIA_BASE + 2
ACIA_CTL    = ACIA_BASE + 3

PROMPT      = '>'
CR          = $0d
LF          = $0a
BS          = $08
ESC         = $1b
LINE_LEN    = 82
XM_BUF_LEN  = 132

XM_ERR_TIMEOUT = 1
XM_ERR_BLOCKNO = 2
XM_ERR_SEQ     = 3
XM_ERR_CKS     = 4

SOH         = $01
EOT         = $04
ACK         = $06
NAK         = $15
CAN         = $18

; zero page
            .virtual $e0
TEMP        .byte ? ; general purpose byte, always assume that subroutines will change this
TEMP_X      .byte ? ; X register backup
TEMP_Y      .byte ? ; Y register backup
MSGL        .byte ? ; message address LSB
MSGH        .byte ? ; message address MSB
ADDR_STARTL .byte ? ; start address
ADDR_STARTH .byte ?
ADDR_ENDL   .byte ? ; end address
ADDR_ENDH   .byte ? ;
            .align 8
XM_ERROR    .byte ? ; xmodem last error
XM_BLK_CNT  .byte ? ; xmodem expected block number
XM_BLK      .byte ? ; xmodem received block number
XM_CKS      .byte ? ; xmodem checksum
XM_ADDRL    .byte ? ; xmodem destination address
XM_ADDRH    .byte ?
XM_COUNT0   .byte ? ; xmodem counter for timeouts
XM_COUNT1   .byte ?
XM_COUNT2   .byte ?
XM_TIMEOUT  .byte ? ; xmodem timeout 
LINE_CNT    .byte ? ; current number of characters in line buffer
LINE_READ   .byte ? ; line buffer read pointer
            .endvirtual
            
            .virtual RAM_END-255
LINE_BUF    .fill LINE_LEN ; size of line buffer
            .align $10
XM_BUFFER   .fill XM_BUF_LEN
END
            .endvirtual

reset:
        cld             ; clear decimal mode
        ldx #$ff        ; initialize stack pointer 
        txs
        
        jsr wait100us
        jsr serial_init
        lda #<MSG_WELCOME
        sta MSGL
        lda #>MSG_WELCOME
        sta MSGH
        jsr write_msg
        
ready:        
        lda #0
        sta LINE_CNT
        lda #PROMPT
        jsr serial_out  ; show prompt

_read_char:
        jsr serial_wait
        jsr serial_out  ; echo
        jsr tolower     ; convert to lower case
        cmp #LF
        beq _read_char   ; ignore line feed
        cmp #CR
        beq newline
        ldy LINE_CNT
        cmp #BS
        bne _store_char
        dey             ; remove last char from buffer
        bmi _reset
        sty LINE_CNT
        jmp _read_char
        
_reset: ldy #0          ; beyond start       
        sty LINE_CNT
        jmp _read_char
        
_store_char:
        cpy #LINE_LEN - 1
        bcs overflow
        sta LINE_BUF,y
        iny
        sty LINE_CNT
        jmp _read_char

newline:
        jsr write_eol
        lda LINE_CNT
        beq ready       ; ignore emty lines
        lda LINE_BUF
        cmp #'?'        ; command "?": help
        bne _chk_x
        jsr cmd_help
        jmp ready
_chk_x:
        cmp #'x'        ; command "x": xmodem
        bne _chk_r
        jsr cmd_xmodem
        jmp ready
_chk_r: 
        cmp #'r'        ; command "r": read memory
        bne _chk_w
        jsr cmd_read
        jmp ready
_chk_w: 
        cmp #'w'        ; command "w": write memory
        bne _chk_f
        jsr cmd_write
        jmp ready
_chk_f: 
        cmp #'f'        ; command "f": fill memory
        bne _chk_g
        jsr cmd_fill
        jmp ready

_chk_g: 
        cmp #'g'        ; command "g": run program
        bne unknown
        jsr cmd_go
        jmp ready

unknown:
        lda #<MSG_UNK_CMD
        sta MSGL
        lda #>MSG_UNK_CMD
        sta MSGH
        jsr write_msg
        jmp ready

overflow:
        lda #<MSG_OVERFLOW
        sta MSGL
        lda #>MSG_OVERFLOW
        sta MSGH
        jsr write_msg
        jmp ready

cmd_help:
        lda #<MSG_HELP
        sta MSGL
        lda #>MSG_HELP
        sta MSGH
        jsr write_msg
        rts

; xmodem transfer
; x1000
cmd_xmodem:
        lda LINE_CNT
        cmp #5
        beq _start
        jsr show_syntax
        rts
_start:
        lda #<MSG_XM_START
        sta MSGL
        lda #>MSG_XM_START
        sta MSGH
        jsr write_msg
        lda #1
        sta LINE_READ
        jsr read_byte
        sta XM_ADDRH
        jsr read_byte
        sta XM_ADDRL
        lda #0
        sta XM_ERROR
        lda #1
        sta XM_BLK_CNT
        lda #CLOCK_MHZ*4 ; set 8sec timeout
        sta XM_TIMEOUT 
_start_nak:
        lda #NAK
        jsr serial_out_no_wait
_wait_packet:        
        jsr _wait_byte
        bcs _char
        jmp _start_nak ; repeat NAK
_char:
        cmp #SOH
        beq _soh
        cmp #EOT
        beq _eot
        cmp #CAN
        beq _can
        lda #<MSG_XM_ABORT
        sta MSGL
        lda #>MSG_XM_ABORT
        sta MSGH
        jsr write_msg
        rts
_can:
        rts        
_eot:
        lda  #ACK    ; send ACK
        jsr serial_out_no_wait
        rts
_soh:
        ldx #0
        sta XM_BUFFER, x
        inx
        lda #CLOCK_MHZ*1 ; set 2sec timeout
        sta XM_TIMEOUT 
_next_byte:
        ; processing time for as single byte waiting in the receive data register is 67us
        ; for 115200 bauds bytes may come in theoretically every 87us      
        jsr _wait_byte
        bcs _store_byte
        lda #XM_ERR_TIMEOUT
        sta XM_ERROR
        rts
_store_byte:        
        sta XM_BUFFER, x
        inx
        cpx #XM_BUF_LEN
        bne _next_byte ; block incomplete -> get another byte
_block_complete:
        ldx #1 ; block number
        lda XM_BUFFER, x
        sta XM_BLK
        ldx #2 ; inverse blocknumber
        lda XM_BUFFER, x
        eor #$ff ; one's complement
        cmp XM_BLK
        beq _number_ok
        lda #XM_ERR_BLOCKNO
        sta XM_ERROR
        jmp _start_nak ; block number mismatch -> start over with NAK 
_number_ok:
        lda XM_BLK_CNT
        cmp XM_BLK
        beq _count_ok
        lda #XM_ERR_SEQ
        sta XM_ERROR
        jmp _start_nak ; block number sequence error -> start over with NAK 
_count_ok:
        lda #0
        sta XM_CKS
        ldx #3 ; first data byte
_next_cks:        
        lda XM_BUFFER,x ; load byte from buffer
        clc
        adc XM_CKS
        sta XM_CKS
        inx
        cpx #XM_BUF_LEN-1 ; exclude ckecksum
        bne _next_cks
        lda XM_BUFFER,x ; load received checksum
        cmp XM_CKS
        beq _cks_ok
        lda #XM_ERR_CKS
        sta XM_ERROR
        jmp _start_nak ; checksum error -> start over with NAK 
_cks_ok:
        ldx #3 ; first data byte
        ldy #0
_next_write:
        lda XM_BUFFER,x ; load byte from buffer
        inx
        sta (XM_ADDRL),y
        iny
        cpx #XM_BUF_LEN-1 ; exclude checksum
        bne _next_write
        clc
        lda XM_ADDRL
        adc #128 ; increment write pointer by 128
        sta XM_ADDRL
        lda XM_ADDRH
        adc #0
        sta XM_ADDRH
        inc XM_BLK_CNT ; increment next expected block number
        lda  #ACK    ; send ACK
        jsr serial_out_no_wait
        jmp _wait_packet
        
; read byte with timeout
; A(out) = character received
; C(out) = set if character returned
; XM_TIMEOUT = number of 2sec timeouts (1=2sec, 4=8sec)
_wait_byte:
        lda #0
        sta XM_COUNT0
        sta XM_COUNT1
        sta XM_COUNT2
_wait_char:        
        jsr serial_in
        bcs _return
        inc XM_COUNT0
        bne _wait_char        
        inc XM_COUNT1
        bne _wait_char        
        inc XM_COUNT2
        lda XM_COUNT2
        cmp XM_TIMEOUT
        bne _wait_char
        clc
_return:        
        rts

; read command
; line "r1000"
; block "r1000-1020"
cmd_read:
        lda LINE_CNT
        cmp #5
        beq _line
        cmp #10
        beq _block
        jsr show_syntax
        rts

_line:
        lda #1
        sta LINE_READ
        jsr read_byte
        sta ADDR_STARTH
        jsr read_byte
        sta ADDR_STARTL
        clc             ; end address = start address + 8
        adc #7
        sta ADDR_ENDL
        lda ADDR_STARTH
        adc #0
        sta ADDR_ENDH
        bcs _overflow
        jsr read_block
        rts
        
_overflow:        
        lda #$ff
        sta ADDR_ENDL
        sta ADDR_ENDH
        jsr read_block
        rts

_block:
        lda #1
        sta LINE_READ
        jsr read_byte
        sta ADDR_STARTH
        jsr read_byte
        sta ADDR_STARTL
        lda #6
        sta LINE_READ
        jsr read_byte
        sta ADDR_ENDH
        jsr read_byte
        sta ADDR_ENDL
        jsr read_block
        rts


; read block from ADDR_START to ADDR_END
read_block:
        lda ADDR_STARTH
        jsr write_byte
        lda ADDR_STARTL
        jsr write_byte
        ldy #0
_byte:  
        lda #' '
        jsr serial_out
        sty TEMP
        ldy #0
        lda (ADDR_STARTL),y
        ldy TEMP
        jsr write_byte
        lda ADDR_STARTL ; check end address LSB 
        cmp ADDR_ENDL  
        bne _next
        lda ADDR_STARTH ; check end address MSB
        cmp ADDR_ENDH   
        bne _next
        jsr write_eol
        rts        
_next:
        inc ADDR_STARTL ; increment start address
        bne _cont
        inc ADDR_STARTH
_cont:        
        iny
        cpy #8
        bcc _byte
        jsr write_eol
        jmp read_block        

; write command
; "w1000:0011aabb"
cmd_write:
        lda LINE_CNT
        cmp #8          ; min line length = 8 ("w1000:00")
        bcs _cont
_error:        
        jsr show_syntax
        rts
_cont:        
        ldy #5
        lda LINE_BUF,y
        cmp #':'
        bne _error
        lda #1
        sta LINE_READ
        jsr read_byte
        sta ADDR_STARTH
        jsr read_byte
        sta ADDR_STARTL
        lda #6 ; first byte
        sta LINE_READ
_next:        
        jsr read_byte
        ldy #0
        sta (ADDR_STARTL),y
        inc ADDR_STARTL
        bne _chk_end
        inc ADDR_STARTH
_chk_end:
        lda LINE_READ
        cmp LINE_CNT
        bcc _next 
        rts

; fill command
; "f1000-1000:ea"
cmd_fill:
        lda LINE_CNT
        cmp #13
        bne _error
        ldy #5
        lda LINE_BUF,y
        cmp #'-'
        bne _error
        ldy #10
        lda LINE_BUF,y
        cmp #':'
        bne _error
        lda #1
        sta LINE_READ
        jsr read_byte
        sta ADDR_STARTH
        jsr read_byte
        sta ADDR_STARTL
        lda #6
        sta LINE_READ
        jsr read_byte
        sta ADDR_ENDH
        jsr read_byte
        sta ADDR_ENDL
        lda #11
        sta LINE_READ
        jsr read_byte
        sta TEMP
_next:        
        ldy #0
        lda TEMP
        sta (ADDR_STARTL),y
        lda ADDR_STARTL ; check end address LSB 
        cmp ADDR_ENDL
        bne _incr
        lda ADDR_STARTH ; check end address MSB
        cmp ADDR_ENDH   
        bne _incr
        rts
_incr:
        inc ADDR_STARTL ; increment start address
        bne _cont
        inc ADDR_STARTH
_cont:        
        jmp _next
_error:        
        jsr show_syntax
        rts

; go command
; "g1000"
cmd_go:
        lda LINE_CNT
        cmp #5
        bne _error
        lda #1
        sta LINE_READ
        jsr read_byte
        sta ADDR_STARTH
        jsr read_byte
        sta ADDR_STARTL
        jsr _jsr
        rts
_error:        
        jsr show_syntax
        rts
_jsr    jmp  (ADDR_STARTL)        
        
show_syntax:
        lda #<MSG_SYNTAX
        sta MSGL
        lda #>MSG_SYNTAX
        sta MSGH
        jsr write_msg
        rts
     
; reads byte (2 hex characters)  from line buffer
; A(out) byte
read_byte:
        sty TEMP_Y
        ldy LINE_READ
        lda LINE_BUF,y
        iny
        ldx LINE_BUF,y
        iny
        sty LINE_READ
        jsr bytetobin
        ldy TEMP_Y
        rts


; write hex nibble to serialinterface
; A(in) nibble
write_nibble:
        and #$0f
        cmp #10
        bcc _digit
        clc
        adc #'a'-10
        jsr serial_out
        rts
_digit:
        clc
        adc #'0'
        jsr serial_out
        rts

; write hex byte to serial interface
; A(in) byte
write_byte:
        tax
        lsr
        lsr
        lsr
        lsr
        jsr write_nibble ; write upper nibble
        txa
        and #$0f
        jsr write_nibble ; write lower nibble
        rts
                
        
; converts ascii hex character to binary
; A(in) = hex character
; A(out) = binary, only valid if input is [0-9a-fA-F]
hextobin:
        cmp #'A'
        bcs _alpha ; char >= 'A'
        sec ; else assume char is decimal digit
        sbc #'0'
        and #$0f
        rts
_alpha:
        ora  #%00100000 ; convert to lower case
        sec
        sbc #'a'-10
        and #$0f
        rts        

; converts ascii character to lower case
; A(in) = character
; A(out) = lower case character
tolower:
        cmp #'A'
        bcc _not_upper
        cmp #'Z'
        bcs _not_upper
        ora  #%00100000 ; set bit 5 (A=$41, a=$61)
_not_upper:
        rts

; converts two hex characters to byte
; A(in) upper nibble
; X(in) lower nibble
; A(out) byte
bytetobin:
        jsr hextobin
        asl
        asl
        asl
        asl
        sta TEMP        ; store upper nibble
        txa
        jsr hextobin ; (does change TEMP)
        ora TEMP
        rts

; initializes ACIA with 115200 8N1, no interrupts
serial_init:
        lda #%00010000 ; 1 stop bit, 8 data bits, 115200bps, internal clock
        sta ACIA_CTL
        lda #%00001011  ; no parity, no echo, no TX interrupts, /RTS=low, no RX interrupts, /DTR=low
        sta ACIA_CMD
        rts

; writes character to serial interface
; blocks until character is sent to workaround 65C51 bug
; A(in) = character to sent
serial_out:
        sta ACIA_DATA
        jsr wait100us   ; 115200bps -> 87us/character
        rts

; writes character to serial interface
; may be called each 100us only
; A(in) = character to sent
serial_out_no_wait:
        sta ACIA_DATA
        rts        

; reads character from serial interface
; A(out) = character received
; C(out) = set if character returned
serial_in:
        lda  ACIA_STATUS
        and #%00001000  ; bit3 = Receiver Data Register Full
        beq _empty
        lda ACIA_DATA
        sec
        rts
_empty:
        clc
        rts
        
; reads character from serial interface
; blocks until character receiver
; A(out) = character received
serial_wait:
        jsr serial_in
        bcc serial_wait
        rts

; wait 20 clock cycles including jsr
wait20clk:
        nop ; CYC=2
        nop ; CYC=2
        nop ; CYC=2
        nop ; CYC=2
        rts ; CYC=12 (jsr+rts)

; wait 100 microseconds including jsr
; changes TEMP
wait100us:
        sty TEMP           ; CYC=3
        ldy #4*CLOCK_MHZ-1 ; CYC=2
_loop:
        jsr wait20clk ; (does change TEMP)
        dey       ; CYC=2
        bne _loop ; CYC=3
        nop       ; CYC=2
        nop       ; CYC=2
        nop       ; CYC=2
        ldy TEMP  ; CYC=4
        rts       ; CYC=12 (jsr+rts)

write_msg:
        ldy #$0
_loop:
        lda (MSGL),y
        beq _done
        jsr serial_out
        iny
        bne _loop
_done:
        rts

write_eol:        
        lda #CR
        jsr serial_out
        lda #LF
        jsr serial_out
        rts
        
nmi:
        rti

irq:
        rti            

MSG_WELCOME:   .text "Monitor 1.1", CR, LF, 0
MSG_UNK_CMD:   .text "unknown command", CR, LF, 0
MSG_XM_START:  .text "xmodem started", CR, LF, 0
MSG_XM_ABORT:  .text "xmodem aborted", CR, LF, 0
MSG_OVERFLOW:  .text "line buffer overlfow", CR, LF, 0
MSG_HELP:      .text "?              show help", CR, LF
               .text "x1000          xmodem transfer", CR, LF
               .text "r1000          read memory line", CR, LF
               .text "r1000-101f     read memory block", CR, LF
               .text "w1000:0011aabb write block", CR, LF
               .text "f1000-1010:ea  fill block", CR, LF
               .text "g1000          run program", CR, LF, 0
MSG_SYNTAX:    .text "syntax error", CR, LF, 0

* = $fffa
        .word nmi       ; NMI
        .word reset     ; RESET
        .word irq       ; IRQ/BRK
