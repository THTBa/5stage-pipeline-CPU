#########################################################
# 4条ccmb指令的测试文件，�??4条指令是
# sllv 可变逻辑左移
# srav 可变算数右移�??
# lb load byte
# bltz  小余0跳转
#########################################################
.text
j main
j inter_1_pro
j inter_2_pro
j inter_3_pro
#�??号中断程�??,1的跑马灯
inter_1_pro:

mfc0 $a0,$2

sw $s1,0($zero)
sw $s2,4($zero)
sw $s3,8($zero)
sw $a0,12($zero)
sw $v0,16($zero)
sw $1,20($zero)
li $1,1
mtc0 $1,$0
li $a0,1
mtc0 $a0,$1

addi $v0,$zero,0
addi $s1,$zero,1
addi $s2,$zero,0
addi $s3,$zero,8
inter_1_loop:
addi $a0,$s1,0
syscall
sll $s1,$s1,4
addi $s2,$s2,1
bne $s2,$s3,inter_1_loop

li $a0,0
mtc0 $a0,$0
li $a0,0
mtc0 $a0,$1

lw $s1,0($zero)
lw $s2,4($zero)
lw $s3,8($zero)
lw $a0,12($zero)
lw $v0,16($zero)
lw $1,20($zero)
mtc0 $a0,$2
eret

#2号中断程序，2的跑马灯
inter_2_pro:
mfc0 $a0,$2
sw $s1,20($zero)
sw $s2,24($zero)
sw $s3,28($zero)
sw $a0,32($zero)
sw $v0,36($zero)
sw $1,40($zero)
li $a0,3
mtc0 $a0,$1
li $a0,1
mtc0 $a0,$1

addi $v0,$zero,0
addi $s1,$zero,2
addi $s2,$zero,0
addi $s3,$zero,8
inter_2_loop:
addi $a0,$s1,0
syscall
sll $s1,$s1,4
addi $s2,$s2,1
bne $s2,$s3,inter_2_loop

li $a0,0
mtc0 $a0,$0
li $a0,0
mtc0 $a0,$1

lw $s1,20($zero)
lw $s2,24($zero)
lw $s3,28($zero)
lw $a0,32($zero)
lw $v0,36($zero)
lw $1,40($zero)
mtc0 $a0,$2
eret

#3号中断程序，3的跑马灯
inter_3_pro:
mfc0 $a0,$2
sw $s1,40($zero)
sw $s2,44($zero)
sw $s3,48($zero)
sw $a0,52($zero)
sw $v0,56($zero)
sw $1,60($zero)
li $a0,7
mtc0 $a0,$1
li $a0,1
mtc0 $a0,$1

addi $v0,$zero,0
addi $s1,$zero,3
addi $s2,$zero,0
addi $s3,$zero,8
inter_3_loop:
addi $a0,$s1,0
syscall
sll $s1,$s1,4
addi $s2,$s2,1
bne $s2,$s3,inter_3_loop

li $a0,0
mtc0 $a0,$0
li $a0,0
mtc0 $a0,$1

lw $s1,40($zero)
lw $s2,44($zero)
lw $s3,48($zero)
lw $a0,52($zero)
lw $v0,56($zero)
lw $1,60($zero)
mtc0 $a0,$2
eret


main:
addi $v0,$zero,0
#首先先测试�?�辑可变左移
addi $s0,$zero,4
addi $s1,$zero,15
addi $s2,$zero,0
addi $s3,$zero,8
sllv_loop:
addi $a0,$s1,0
syscall
sllv $s1,$s1,$s0 # $s1=$s1<<$s0
addi $s2,$s2,1
bne  $s2,$s3,sllv_loop

#测试算数可变右移
addi $s2,$zero,0
addi $s1,$zero,15
sll $s1,$s1,28
srav_loop:
addi $a0,$s1,0
syscall
srav $s1,$s1,$s0
addi $s2,$s2,1
bne  $s2,$s3,srav_loop

#测试lb
addi $s1,$zero,170 #0xAA
sw $s1,0($zero)
lb $s1,0($zero)
addi $a0,$s1,0
syscall

#测试bltz
#从上面的代码可知 $s1的�?�是0xffffffaa,小余0
bltz $s1,bltz_test
addi $a0,$zero,1
j bltz_end
bltz_test:
addi $a0,$zero,2
bltz_end:
syscall

addi $v0,$zero,10
syscall #halt
