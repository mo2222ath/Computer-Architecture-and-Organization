#Author Muaath Hasan
#Version 2
#Date 11 /12 / 2019
#MIPS program that takes an array of characters and prints the number of UPPERCASE letters and the number of LOWERCASE letters
#done !!
.data 

str: .asciiz "ABCdEfgH"
lowercase: .asciiz "Number of lowercase = "
uppercase: .asciiz "Number of uppercase = "
endl: .asciiz "\n"

.text

main:

la $t1, str
addi $s1 , $s1 , 0
addi $s2 , $s2 , 0

nextCh: lb $t2, ($t1)
beqz $t2, strEnd
addi $t4, $zero, 0x61
sub $t3, $t2, $t4
bgez $t3, l1
addi $s1, $s1, 1
sb $t2, ($t1)
l1: add $t1, $t1, 1
addi $s2 , $s2 , 1
j nextCh

strEnd:
la $a0, str
li $v0, 4
syscall
la $a0, endl
li $v0, 4
syscall
la $a0, uppercase
li $v0, 4
syscall
move $a0, $s1
li $v0,1
syscall
la $a0, endl
li $v0, 4
syscall
la $a0, lowercase
li $v0, 4
syscall
sub $s2 , $s2 , $s1
move $a0, $s2
li $v0,1
syscall
la $a0, endl
li $v0, 4
syscall
li $v0, 10
syscall
