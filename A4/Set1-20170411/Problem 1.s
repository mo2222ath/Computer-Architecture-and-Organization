#Author Muaath Hasan
#Version 2
#Date 11 /12 / 2019
#MIPS program to implement the following C code segment. 
#if (g > h)
#     g = g + h;
#else if (g < h)
#     g = g − h;
#else 
#     g = g * h;

.data


.text

.globl main

main:

li $s0 , 9   #Load 9 in $s0
li $s1 , 7   #Load 7 in $s1

beq $s0 , $s1 , else_   #check if $s0 = $s1 
	j else_if           #jump else-if 

else_if:
	bgt $s0 , $s1 , if_          #check if $s0 > $s1 ,
		sub $s0 , $s0 , $s1      #substract h from g
		j Exit                   #jump Exit
else_:
	mul $s0 , $s0 , $s1          #multiply $s0 , $s1
	j Exit                       #jump Exit
if_:
	add $s0 , $s0 , $s1          #add $s0 , $s1
		j Exit                   #jump Exit

Exit:
	li $v0, 1                    #print integer
	move $a0, $s0                #move value of $s0 to $a0
	syscall 
	li $v0, 10                   #Exit from program
	syscall

.end main
