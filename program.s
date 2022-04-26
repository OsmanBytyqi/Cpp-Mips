.text
.globl main

main:
addi $s0,$zero,4
add $a0,$s0,$zero      # vendosja e vleres se regjistrit s0 ne argument
jal printFun           #thirrja  e funkstionit
printFun:
addi $sp,$sp,-8        # rezervimi i hapsires ne stack 
sw $ra,4($sp)          # rezervimi i vleres return ne stack
sw $s0,0($sp)          # rezervimi i vleres se parametrit ne stack
slti $t0,$s0,1         #test for n<1
beq $t0,$zero,else     #if test>=1 go to else 
beq $t0,1 else2
addi $sp,$sp,8         #lirimi i hapsires se stackut 

printfun2:
addi $sp,$sp,-8        # rezervimi i hapsires ne stack 
sw $ra,4($sp)          # rezervimi i vleres return ne stack
sw $s0,0($sp)          # rezervimi i vleres se parametrit ne stack
slti $t0,$s0,4         #test for n<1
beq $t0,1 else2
addi $sp,$sp,8         #lirimi i hapsires se stackut 
li $v0,10
syscall

else:
li $v0,1               # print test 
move $a0,$s0
syscall

li $v0,4               #print space
la $a0,space           #load address of space
syscall

addi $s0,$s0,-1        #t-1
sw $s0,0($sp)          #ruajta ne stack 
j printFun             #kcimi ne printfun
addi $sp,$sp,8         #zbrasja e stackut

li $v0,1               # print test 
move $a0,$a0
syscall

li $v0,4              #print space
la $a0,space          #load address of space
syscall
addi $v0,$zero,0       #return 
jr $ra

else2:
addi $s0,$s0,1
li $v0,1               # print test 
move $a0,$s0
syscall

li $v0,4               #print space
la $a0,space           #load address of space
syscall

sw $s0,0($sp)          #ruajta ne stack 
j printfun2             #kcimi ne printfun
addi $sp,$sp,8         #zbrasja e stackut

.data
space: .asciiz " "
