.data
   input_prompt: .asciiz "Enter a string:\n"
   inputVar: .space 24
   output_prompt: .asciiz "The value +5 is:\n"

.text
	main:
		# print input_prompt
		la $a0, input_prompt
		li $v0, 4
		syscall
   
	   #Read inputVar
	   la $a0, inputVar        
	   li $v0, 8
	   move $t0, $a0
	   syscall
	   
	   # print output_prompt
	   la $a0, output_prompt
	   li $v0, 4
	   syscall
	   
	   #remove the character and keep the numbers
	   li $t5, 1			
	   la $t0, inputVar($t5)	
	   lbu $t1, ($t0)       
	   li $a1, 10           
	   li $a0, 0            
	   addi $t1,$t1,-48  	
	   move $a2, $t1        
	   add $a0, $a0, $t1    
	   addi $t0, $t0, 1      
	   lbu $t1, ($t0) 
	   
	findNext:
	   beq $t1, $a1, addAndEnd
	   addi $t1,$t1,-48  	
	   move $a2, $t1        
	   mul $t2, $a0, 10  	
	   add $a0, $t2, $t1    
	   addi $t0, $t0, 1      
	   lbu $t1, ($t0)        
	   b findNext
	   
	addAndEnd:
	   add $a0, $a0, 5
	   li $v0, 1           
	   syscall
	   b exit
 
exit:
   jr $ra  