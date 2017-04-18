start:
add $v0,$0,$0
lui $v0,0xffff
xori $v0,0xffff
addi $s0,$0,15
sw $s0,0($0)
lh $s0,3($0)
add $a0,$0,$s0
syscall
bgez $s0,next
j start
next:
addi $v0,$0,0xa
syscall