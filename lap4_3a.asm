		.data
array:		.asciiz "The factorial of 10 is "
		.text
main:		addi $a0, $a0, 10
		jal fact
		add $s1, $v0, $zero
		li $v0, 4
		la $a0, array	
		syscall
		li $v0, 1
		add $a0, $s1, $zero
		syscall
		j exit
		
fact:
	slti $t0, $a0, 1
	beq $t0, $zero ,else
	addi $v0, $zero, 1
	jr $ra
else:	
	bne $v0, $zero, return 
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $a0, $a0, -1
	jal  fact
return:
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	mult $a0, $v0
	mflo $v0
	jr $ra	
exit:	
