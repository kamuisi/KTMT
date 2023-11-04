
add $t0, $s0, $zero

sll $t0, $t0, 2
add $t0, $t0, $s1
sum: 	addi $t0, $t0, -4
	lw $t3, 0($t0)
	add $t1, $t1, $t3
	bne $t0, $s1, sum 
