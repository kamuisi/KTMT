addi $s2, $zero, 0
addi $s0, $zero, 1
loop: 	
	slt $t0, $s1, $s0
	bne $t0, $zero, exit
	add $s2, $s2, $s0
	addi $s0, $s0, 1
	j loop
exit: