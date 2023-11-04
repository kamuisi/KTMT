		.data
text_1:		.asciiz "Nhap so phan tu mang: "
text_2: 	.asciiz "Nhap gia tri tung phan tu mang:\n"
i_: 		.word 0
j_: 		.word 0
n:		.word 0
array_A: 	.word 0
		.text
#nhap mang
	la $s3, array_A
	la $t0, n
	la $a0, text_1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	sll $t0, $v0, 2
	add $t0, $t0, $s3
	add $t3, $s3, $zero
	la $a0, text_2
	li $v0, 4
	syscall
loop:
	li $v0, 5
	syscall 
	sw $v0, 0($t3)
	addi $t3, $t3, 4
	bne $t3, $t0, loop
#Lenh duoc chuyen
	la $s0, i_
	la $s1, j_
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	slt $t4, $t0, $t1
	beq $t4, $zero, else
	add $t3, $t0, $zero
	sll $t3, $t3, 2
	add $t3, $s3, $t3
	sw $t0, 0($t3)
	j exit
else:	
	add $t3, $t0, $zero
	sll $t3, $t3, 2
	add $t3, $s3, $t3
	sw $t1, 0($t3)
exit: