; running light on VIA0+1 port A+B
; cylce ~ 200ms
; on NMI sets port A to $f1
; on IRQ sets port A to $f2

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
VIA1_BASE   = $7f10
VIA1_ORB    = VIA1_BASE + 0
VIA1_IRB    = VIA1_BASE + 0
VIA1_ORA    = VIA1_BASE + 1
VIA1_IRA    = VIA1_BASE + 1
VIA1_DDRB   = VIA1_BASE + 2
VIA1_DDRA   = VIA1_BASE + 3

; zero page
            .virtual $20
TEMP        .byte ? ; general purpose byte, always assume that subroutines will change this
INDEX_A     .byte ?
INDEX_B     .byte ?
            .endvirtual

reset:
        lda #$ff          ; set all VIA ports to output
        sta VIA0_DDRA
        sta VIA0_DDRB
        sta VIA1_DDRA
        sta VIA1_DDRB
        
        lda #00
        sta INDEX_A
        lda #size(PATTERNS)/2
        sta INDEX_B
  
loop:
        ldx #INDEX_A
        jsr next_pattern
        sta VIA0_ORA
        sta VIA1_ORA
        
        ldx #INDEX_B
        jsr next_pattern
        sta VIA0_ORB
        sta VIA1_ORB
        
        jsr wait200ms
        
        jmp loop

next_pattern:
        lda $00,x
        tay
        inc $00,x
        lda $00,x
        cmp #size(PATTERNS)
        bcc _noinc
        lda #0
        sta $00,x
_noinc:
        lda PATTERNS,y
        rts
      
nmi:
        lda #$ff
        sta VIA0_DDRA
        lda #$f1
        sta VIA0_ORA
        rti
      
irq:
        lda #$ff
        sta VIA0_DDRA
        lda #$f2
        sta VIA0_ORA
        rti
      

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
       
wait10ms:
        txa
        ldx #100
_loop:
        jsr wait100us
        dex
        bne _loop
        tax
        rts
        
wait200ms:
        txa
        ldx #20
_loop:
        jsr wait10ms
        dex
        bne _loop
        tax
        rts

PATTERNS   .byte  $80, $40, $20, $10, $08, $04, $02, $01, $02, $04, $08, $10, $20, $40
        

* = $fffa
        .word nmi   ; NMI
        .word reset ; RESET
        .word irq   ; IRQ/BRK
