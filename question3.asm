.data
	input_prompt:	.asciiz "Enter a series of 5 formulae:\n"
	nline: .asciiz "\n"
	string_array: .space 24
	input_string: .word 0
	output_prompt:	.asciiz "The values are:\n"
	
.text
	main:
		#print input_prompt
		la $a0, input_prompt
		li $v0, 4
		syscall
		
		# get input
		li $t0, 2
		li $s0, 0
	load_input:
		la $s1, string_array
		la $a0, input_string
		li $v0, 8
		syscall
		 
		move $s3, $a0
		lb $s4, ($s3)
		move $s7, $s0
		beq $s4, 61, set
		move $s5, $s4
		addu $s3, $s3, 1
		lb $s4, ($s3)
		move $s6, $s4
		b save
		
	continue:
		addi $s0, $s0, 1
		blt $s0, 5, load_input
		la $a0, output_prompt
		li $v0, 4
		syscall
		
		la $s0, string_array
		li $s2, 0
		b display
		
	set:
		addi $s3, $s3, 1
		lb $s4, ($s3)
		addi $s4, $s4, -48
		mult $s4, $t0
		mflo $s4
		addu $s1, $s1, $s4
		lb $s5, ($s1)
		addu $s1, $s1, 1
		lb $s6, ($s1)
		b save
		
	save:
		la $s1, string_array
		mult $s7, $t0
		mflo $s7
		add $s1, $s1, $s7
		sb $s5, ($s1)
		add $s1, $s1, 1
		sb $s6, ($s1)
		b continue
		
	display:
		lb $s1, ($s0)
		addi $s1, $s1, -48
		move $a0, $s1
		li $v0, 1
		syscall

		addi $s0, $s0, 1
		lb $s1, ($s0)
		beq $s1, 10, next
		addi $s1, $s1, -48
		move $a0, $s1
		li $v0, 1
		syscall
		
	next:
		la $a0, nline
		li $v0, 4
		syscall
		
		addi $s0, $s0, 1
		addi $s2, $s2, 2
		beq $s2, 10, exit
		b display
exit:
	jr $ra

