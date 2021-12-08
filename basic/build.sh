#!/bin/bash
#curl -L -o basic_2.22p5.asm https://raw.githubusercontent.com/Klaus2m5/6502_EhBASIC_V2.22/master/patched/basic.asm
cp basic_2.22p5.asm basic.asm
# .byte -> .text
sed -i 's/  .byte "/  .text "/'               basic.asm
sed -i 's/.byte $0D,$0A,"/.text $0D,$0A,"/'   basic.asm
# IF [expr] -> IF (expr)
sed -i 's/IF \[\* \& $FF\]/IF \(\* \& $FF\)/' basic.asm
# CMP #[expr] -> #(expr)
sed -i -r 's/(#[<>]*)\[(\S*)\]/\1\(\2\)/'     basic.asm

# change RAM/ROM to $8000
sed -i -r 's/Ram_top           = \$C000/Ram_top           = \$8000/'     basic.asm
sed -i -r 's/\*=    \$C000/\*=    \$8000/'     basic.asm

# append acia code
cat acia.asm >> basic.asm

64tass --nostart --tab-size 2 --line-numbers --list basic.lst --output basic.bin basic.asm


