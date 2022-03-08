; sends "Hello, World!" to serial out and then returns
; designed to be run in RAM, uploaded and started from monitor

  * = $2d00

CLOCK_MHZ   = 1 ; // clock frequency in MHz

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


start:
        cld             ; clear decimal mode
        ldx #$ff        ; initialize stack pointer 
        txs

        jsr serial_init
 
        lda #<MSG_HELLO
        sta MSGL
        lda #>MSG_HELLO
        sta MSGH
        jsr show_msg
        
        rts


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

MSG_HELLO  .text "Hello, World!", $0d, $0a, 0
