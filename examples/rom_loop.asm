; simple test program to verify basic function of ROM access

  * = $8000
reset:
        nop
        nop
        nop
        nop
        nop
        jmp reset


  * = $fffc
  .word reset
  .word $0000
  
