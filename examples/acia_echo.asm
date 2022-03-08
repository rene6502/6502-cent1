; sends "Welcome" to serial out, then polls serial in
; and echoes character
; converts character to lower case
; sets PA0 after init
; toggle PA1 after receive

  * = $8000

CLOCK_MHZ   = 1 ; // clock frequency in MHz

; 65C22 VIA
VIA0_BASE   = $7f00
VIA0_ORB    = VIA0_BASE + 0
VIA0_IRB    = VIA0_BASE + 0
VIA0_ORA    = VIA0_BASE + 1
VIA0_IRA    = VIA0_BASE + 1
VIA0_DDRB   = VIA0_BASE + 2
VIA0_DDRA   = VIA0_BASE + 3

; 65C51 ACIA
ACIA_BASE   = $7f20
ACIA_DATA   = ACIA_BASE + 0
ACIA_STATUS = ACIA_BASE + 1
ACIA_CMD    = ACIA_BASE + 2
ACIA_CTL    = ACIA_BASE + 3

; zero page
            .virtual $20
TEMP        .byte ? ; general purpose byte, always assume that subroutines will change this
MSGL        .byte ? ; message address LSB
MSGH        .byte ? ; message address MSB
            .endvirtual


reset:
        cld             ; clear decimal mode
        ldx #$ff        ; initialize stack pointer 
        txs

        jsr serial_init
        lda #$ff
        sta VIA0_DDRA
        lda #%00000001
        sta VIA0_ORA
 
        lda #<MSG_WELCOME
        sta MSGL
        lda #>MSG_WELCOME
        sta MSGH
        jsr show_msg

loop:
        jsr serial_in
        bcc loop ; no char available
        
        ldx #%00000010
        stx VIA0_ORA
        
        jsr tolower
        jsr serial_out

        ldx #%00000001
        stx VIA0_ORA
        
        jmp loop

; initializes ACIA with 115200 8N1, no interrupts
serial_init:
        lda #%00010000 ; 1 stop bit, 8 data bits, 115200bps, internal clock
        sta ACIA_CTL
        lda #%00001011 ; no parity, no echo, no TX interrupts, /RTS=low, no RX interrupts, /DTR=low
        sta ACIA_CMD
        rts

; writes character to serial interface
; blocks until character is sent to workaround 65C51 bug
; A(in) = character to sent
serial_out:
        sta ACIA_DATA
        jsr wait100us ; 115200bps -> 87us/character
        rts

; reads character from serial interface
; A(out) = character received
; C(out) = set if character returned
serial_in:
        lda  ACIA_STATUS
        and #%00001000 ; bit3 = Receiver Data Register Full
        beq _empty
        lda ACIA_DATA
        sec
        rts
_empty:
        clc
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
        dey         ; CYC=2
        bne _loop   ; CYC=3
        nop         ; CYC=2
        nop         ; CYC=2
        nop         ; CYC=2
        ldy TEMP    ; CYC=4
        rts         ; CYC=12 (jsr+rts)

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
        
show_msg:
        ldy #$0
_loop:
        lda (MSGL),y
        beq _done
        jsr serial_out
        iny
        bne _loop
_done:
        rts 

MSG_WELCOME  .text "Welcome",$0a,0

  * = $fffc
  .word reset
  .word $0000

  
