#Author Muaath Hasan
#Version 2
#Date 11 /12 / 2019
#Translate the  C program to MIPS assembly.
# int main() {
# ...
# t1 = sumOdd (10);
# printf ("%d", t1);
# ...
# }
# int sumOdd (int n) {
# int i, result = 0;
# for (i = 0; i < n; i++)
# if ((i % 2) == 1)
# result += i;
# return result;
# }

.data 
  print : .asciiz "sum of odd num is : \n"
.text 

.globl main 
main:


li $v0 , 4
la $a0 , print
syscall
  
addi $a1 , $zero , 9       #set value of $a1 = 9

jal sumodd           #jump and link with function summodd


addi $a0 , $v1 , 0   #set $a1 result
li $v0, 1            #print integer
syscall

li $v0, 10
syscall

.end main 

sumodd:


li $s0 , 0         # i=0
li $v1 , 0         #result=0
li $s3  , 2        #set remcheck =2
li $s4 , 0         #set remresult=0
li $s5 , 1         #set checkodd=1

Loop:
	blt $s0 , $a1 , ifcond        #check if i < a ,true jump to ifcond
	j Exit
ifcond:
	rem $s4 , $s0,$s3             #get reminder $s0 ,$s3 and store result in $s4
	beq $s4 , $s5 , calresult     #check if reminderresult = 1 , jump to claresult 
	addi $s0 , $s0 , 1            # i++
	j Loop                        # jump Loop
calresult:
	add $v1 , $v1 ,$s0           #result+= i; 
	addi $s0 , $s0 , 1           #i++
	j Loop                       #jump Loop
	
Exit:
	jr $ra                     #jump and return $ra
	

