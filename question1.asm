.data
#declare variable names to store the 5 strings
input1: .word 0
input2: .word 0
input3: .word 0
input4: .word 0
input5: .word 0

#input and output promting msg

prom_input: .asciiz "Enter a series of 5 formulae:\n"
prom_output: .asciiz "The values are:\n"

.text
main:
	#print prom_input
	la $a0, prom_input
	li $v0, 4
	syscall
	
	#get input
	
	la $a0,input1
	li $v0, 8
	syscall
	
	la $a0, input2
	li $v0, 8
	syscall
	
	la $a0,input3
	li $v0, 8
	syscall
	
	la $a0, input4
	li $v0,8
	syscall
	
	la $a0, input5
	li $v0, 8
	syscall
	
	#print promting
	la $a0, prom_output
	li $v0, 4
	syscall
	
	#print output
	
	la $a0,input1
	li $v0, 4
	syscall
	
	la $a0,input2
	li $v0, 4
	syscall
	
	la $a0,input3
	li $v0, 4
	syscall
	
	la $a0,input4
	li $v0, 4
	syscall
	
	la $a0,input5
	li $v0, 4
	syscall
	
	jr $ra
	
	
	
	
	
	
	
	
	
	
	