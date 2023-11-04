		.data
array1: 	.word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: 		.word 10
array2: 	.byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: 		.word 16
array3: 	.space 8
size3: 		.word 8
space:  	.asciiz " "
text_1:		.asciiz "\nArray 1: "
text_2:		.asciiz "\nArray 2: "
text_3:		.asciiz "\nArray 3: "
text_4: 	.asciiz "\nNhap so cua mang can lay: "
text_5:		.asciiz "Chi so phan tu can lay: "
text_6:		.asciiz "Phan tu can lay la: "
text_7: 	.asciiz "Invalid Type"
		.text
#array 1
	la $s1, array1
	li $v0, 4
	la $a0, text_1
	syscall
	add $t0, $s1, $zero
	addi $t4, $s1, 40
array1_loop:
	lw $a0, 0($t0)
	addi $t0, $t0, 4
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	bne $t0, $t4, array1_loop
#array 2
	la $s2, array2
	li $v0, 4
	la $a0, text_2
	syscall
	add $t0, $s2, $zero
	addi $t4, $s2, 16
array2_loop:
	lb $a0, 0($t0)
	addi $t0, $t0, 1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	bne $t0, $t4, array2_loop
#array 3
	la $s3, array3
	add $t0, $s2, $zero
	add $t3, $s3, $zero
	addi $t4, $s3, 8
	addi $t5, $s2, 16
	addi $t5, $t5, -1
array3_loop:
 	lb $t1, 0($t0)
 	lb $t2, 0($t5)
 	add $t1, $t2, $t1
 	sb $t1, 0($t3)
 	addi $t3, $t3, 1
 	addi $t0, $t0, 1
 	addi $t5, $t5, -1
 	bne $t3, $t4 array3_loop
#Xuat theo yeu cau	
	la $a0, text_4
	syscall
	li $v0, 5
	syscall
	add $t5, $v0, $zero
	slti $t6, $t5, 4
	beq $t6, $zero, error
	li $v0, 4
	la $a0, text_5
	syscall
	li $v0, 5
	syscall
	add $t4, $v0, $zero
	addi $t5, $t5, -1
	beq $t5, $zero, Xuat_array1
	addi $t5, $t5, -1
	beq $t5, $zero, Xuat_array2
	addi $t5, $t5, -1
	beq $t5, $zero, Xuat_array3
error:		
	li $v0, 55
	la $a0, text_7
	li $a1, 0
	syscall
	j exit
Xuat_array1:
	lw $t1, size1
	slt $t5, $t1, $t4
	bne $t5, $zero, error
	li $v0, 4
	la $a0, text_6
	syscall
	addi $t4, $t4, -1
	sll $t4, $t4, 2
	add  $t0, $s1, $t4
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	j exit
Xuat_array2:
	lb $t2, size2
	slt $t5, $t2, $t4
	bne $t5, $zero, error
	li $v0, 4
	la $a0, text_6
	syscall
	addi $t4, $t4, -1
	add  $t0, $s2, $t4
	lb $a0, 0($t0)
	li $v0, 1
	syscall
	j exit
Xuat_array3:
	lb $t3, size3
	slt $t5, $t3, $t4
	bne $t5, $zero, error
	li $v0, 4
	la $a0, text_6
	syscall
	addi $t4, $t4, -1
	add  $t0, $s3, $t4
	lb $a0, 0($t0)
	li $v0, 1
	syscall
exit:
	
	
	
	

