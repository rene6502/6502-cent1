
        * = $8000
        
CLOCK_MHZ   = 1         ; // clock frequency in MHz

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
BUF_LEN     = 82

; zero page
            .virtual $20
TEMP        .byte ?     ; general purpose byte, always assume that subroutines will change this
MSGL        .byte ?     ; message address LSB
MSGH        .byte ?     ; message address MSB
LD_CHECKSUM .byte ?
LD_ADDRESSL .byte ?
LD_ADDRESSH .byte ?
ADDR_STARTL .byte ?
ADDR_STARTH .byte ?
ADDR_ENDL   .byte ?
ADDR_ENDH   .byte ?
LINE_CNT    .byte ?
LINE_BUF    .fill BUF_LEN
            .endvirtual

reset:
        cld             ; clear decimal mode
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

read_char:
        jsr serial_wait
        jsr serial_out  ; echo
        jsr tolower     ; convert to lower case
        cmp #LF
        beq read_char   ; ignore line feed
        cmp #CR
        beq newline
        ldy LINE_CNT
        cmp #BS
        bne _store_char
        dey             ; remove last char from buffer
        bmi _reset
        sty LINE_CNT
        jmp read_char
        
_reset: ldy #0          ; beyond start       
        sty LINE_CNT
        jmp read_char

_store_char:
        cpy #BUF_LEN - 1
        bcs overflow
        sta LINE_BUF,y
        iny
        sty LINE_CNT
        jmp read_char

newline:
        jsr write_eol
        lda LINE_CNT
        beq ready       ; ignore emty lines
        lda LINE_BUF
        cmp #'?'        ; command "?": help
        bne _chk_l
        jsr cmd_help
        jmp ready
_chk_l:
        cmp #'l'        ; command "l": download
        bne _chk_r
        jsr cmd_download
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

; example:
; :07100000EAEAEAEA4C0010E5
; :00000001FF
; :<byte count><address><type><data><cks>
; type: 00 -> data, 01 -> eof
cmd_download:
        lda #<MSG_DL_START
        sta MSGL
        lda #>MSG_DL_START
        sta MSGH
        jsr write_msg

_read_start:
        jsr serial_wait
        cmp #':'
        bne _read_start

        lda #$00
        sta LD_CHECKSUM ; reset checksum
_next:
        jsr read_hex    ; read byte count
        tax             ; x -> byte count
        jsr read_hex    ; read address MSB
        sta LD_ADDRESSH
        jsr read_hex    ; read address LSB
        sta LD_ADDRESSL
        jsr read_hex    ; read record type
        beq _data       ; 0 -> data
        cmp #$01        ; 1 -> eof
        bne _err_unk
_eof:          
        jsr read_hex    ; read checksum
        lda LD_CHECKSUM
        bne _err_cks    ; checksum must be 0

        lda #<MSG_DL_END
        sta MSGL
        lda #>MSG_DL_END
        sta MSGH
        jsr write_msg
        
        rts
_data:  
        ldy #0          ; x -> byte index
_read_byte:
        jsr read_hex    ; read data byte
        sta (LD_ADDRESSL),y
        iny
        dex             ; decrement byte count
        bne _read_byte
        jsr read_hex    ; read checksum
        lda LD_CHECKSUM
        bne _err_cks    ; checksum must be 0
        lda #'.'        ; send '.' as acknowledgmenet
        jsr serial_out
        jmp _read_start;

_err_unk:
        lda #<MSG_UNK_REC
        sta MSGL
        lda #>MSG_UNK_REC
        sta MSGH
        jsr write_msg
        rts

_err_cks:
        lda #<MSG_CKS_ERR
        sta MSGL
        lda #>MSG_CKS_ERR
        sta MSGH
        jsr write_msg
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
        ldy #1
        jsr read_addr
        sta ADDR_STARTH
        stx ADDR_STARTL
        txa
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
        ldy #1
        jsr read_addr
        sta ADDR_STARTH
        stx ADDR_STARTL
        ldy #6
        jsr read_addr
        sta ADDR_ENDH
        stx ADDR_ENDL
        jsr read_block
        rts

; reads address (4 hex characters)  from line buffer
; Y(in)  start index in line buffer
; A(out) address LSB
; X(out) address MSB
read_addr:
        lda LINE_BUF,y
        iny
        ldx LINE_BUF,y
        iny
        jsr bytetobin
        pha
        lda LINE_BUF,y
        iny
        ldx LINE_BUF,y
        jsr bytetobin
        tax
        pla
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
        ldy #1
        jsr read_addr
        sta ADDR_STARTH
        stx ADDR_STARTL
        ldy #6 ; first byte
_next:        
        lda LINE_BUF,y
        iny
        ldx LINE_BUF,y
        iny
        jsr bytetobin
        sty TEMP
        ldy #0
        sta (ADDR_STARTL),y
        ldy TEMP
        inc ADDR_STARTL
        bne _chk_end
        inc ADDR_STARTH
_chk_end:        
        cpy LINE_CNT
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
        ldy #1
        jsr read_addr
        sta ADDR_STARTH
        stx ADDR_STARTL
        ldy #6
        jsr read_addr
        sta ADDR_ENDH
        stx ADDR_ENDL
        ldy #11
        lda LINE_BUF,y
        iny
        ldx LINE_BUF,y
        iny
        jsr bytetobin
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
        ldy #1
        jsr read_addr
        sta ADDR_STARTH
        stx ADDR_STARTL
        jmp (ADDR_STARTL)
_error:        
        jsr show_syntax
        rts
        
show_syntax:
        lda #<MSG_SYNTAX
        sta MSGL
        lda #>MSG_SYNTAX
        sta MSGH
        jsr write_msg
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

; write hex byte to serialinterface
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

; reads hex byte from serial interface
; A(out) = bytes
; adds byte to checksum
read_hex:
        jsr serial_wait
        jsr hextobin
        asl
        asl
        asl
        asl
        sta TEMP        ; store upper nibble
        jsr serial_wait
        jsr hextobin
        ora TEMP
        sta TEMP
        clc ; update checksum
        adc LD_CHECKSUM 
        sta LD_CHECKSUM
        lda TEMP
        rts
        
; converts ascii hex character to binary
; A(in) = hex character
; A(out) = binary, only valid if input is [0-9a-fA-F]
hextobin:
        cmp #'9'
        bcs _alpha
        sec
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
        jsr hextobin
        ora TEMP
        rts

; initializes ACIA with 115200 8N1, no interrupts
serial_init:
        lda #%00010000  ; 1 stop bit, 8 data bits, 115200bps, internal clock
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
        jsr wait20clk
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

write_char:
        jsr serial_out
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
                
MSG_WELCOME:   .text "Monitor 1.0", CR, LF, 0
MSG_UNK_CMD:   .text "unknown command", CR, LF, 0
MSG_DL_START:  .text "download started", CR, LF, 0
MSG_DL_END:    .text  CR, LF, "download succeeded", CR, LF, 0
MSG_UNK_REC:   .text "unknown record type", CR, LF, 0
MSG_CKS_ERR:   .text "checksum error", CR, LF, 0
MSG_OVERFLOW:  .text "line buffer overlfow", CR, LF, 0
MSG_HELP:      .text "?              show help", CR, LF
               .text "l              start intel hex loader", CR, LF
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
