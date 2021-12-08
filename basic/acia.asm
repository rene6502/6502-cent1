
CLOCK_MHZ   = 1 ; // clock frequency in MHz

; 65C51 ACIA
ACIA_BASE   = $7f20
ACIA_DATA   = ACIA_BASE + 0
ACIA_STATUS = ACIA_BASE + 1
ACIA_CMD    = ACIA_BASE + 2
ACIA_CTL    = ACIA_BASE + 3

; zero page
TEMP        = $e2 ; general purpose byte, always assume that subroutines will change this
          
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
          
reset:
        cld         ; clear decimal mode
        ldx #$ff    ; empty stack
        txs         ; set the stack        
        jsr serial_init
        
        ldy #size(vectors)
_loop:
        lda   vectors-1,y
        sta   VEC_IN-1,y        ; save to RAM
        dey
        bne _loop

        jmp LAB_COLD
        
ignore:
        rts

nmi:
        rti
irq:
        rti

vectors: .word serial_in, serial_out, ignore, ignore

* = $fffa
        .word nmi   ; NMI
        .word reset ; RESET
        .word irq   ; IRQ/BRK


