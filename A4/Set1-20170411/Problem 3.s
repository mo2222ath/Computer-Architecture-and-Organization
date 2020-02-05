#Author Muaath Hasan
#Version 2
#Date 11 /12 / 2019
# MIPS program to execute the following nested C loop.
# for(i = 0; i < a; i++) 
#        for(j = 0; j < b; j++) 
#           C[2 * i] = i - j;


.data 
space: .asciiz "\n"
array: .word 0
msg : .asciiz " "
.text 
.globl main 
main:

li $s0 , 0    #i =0
li $s1 , 0    #j =0
li $s2 , 3   #a =3
li $s3 ,0  # result=  i-j
li $s4 , 4   #b =4
li $s6 , 2 




outerLoop:
	blt $s0 , $s2 , innerLoop # i < a 
	j Exit

innerLoop:
	
	blt $s1 , $s4 , Execute   # j < b
	addi $s0 , $s0 , 1        # i++
	sub $s1 , $s1 , $s1        # j=0
	j outerLoop               # jump to outerloop

Execute :
        la $t0 , array          #load array in $t0
        sll $t1, $s0, 1	        #$t0 = $t0 * 2
        add $t1,$t1,$t0         #addres of c
        lw $t1 , 0($t0)          #t1 = c[2*j]
        sub $t1 , $s0 ,$s1       #c[2*i] = i-j 
        addi $s1 , $s1 , 1        # j++
        move $s5 , $t1       #load array[i]
	li $v0, 1
	move $a0, $s5             #print arrray[i]
	syscall
	addi $v0, $zero, 4        # print_string syscall
        la $a0, msg             # load address of the string
        syscall
        j innerLoop
Exit:
        
        li $v0, 10
	syscall

.end main 
