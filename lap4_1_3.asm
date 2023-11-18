		move $a0, $s0
		move $a1, $s1
		move $a2, $s2
		move $a3, $s3
		addi $sp, $sp, -4
		sw $s4, 0($sp)
		addi $sp, $sp, -4
		sw $s5, 0($sp)
		jal proc_example
		
		move $a0, $v0
		li $v0, 1
		syscall
		
		move $a0, $v1
		li $v0, 1
		syscall
		j exit
		
proc_example:
		lw $t3, 0($sp)
		addi $sp, $sp, 4
		lw $t2, 0($sp)
		addi $sp, $sp, 4
		
		addi $sp, $sp, -4
		sw $s0, 0($sp)
		addi $sp, $sp, -4
		sw $s1, 0($sp)
		
		add $t0, $a0, $a1
		add $t1, $a2, $a3
		sub $s0, $t0, $t1
		
		move $v0, $s0
		
		sub $s1, $t2, $t3
		
		move $v1, $s1
		
		lw $s1, 0($sp)
		addi $sp, $sp, 4
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
exit:	
