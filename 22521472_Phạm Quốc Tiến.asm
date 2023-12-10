	.data
string1:	.asciiz "Nhap so phan tu: "
string2:	.asciiz "Nhap tung phan tu: "
string3: 	.asciiz "Mang sau khi sap xep: "
string4:	.asciiz "\nMang duoi dang nhi phan: "
space:		.asciiz " "
min:		.word 0
vi_tri:		.word 0
n:	.word 0
array:	.word 0
	.text
main:
	li $v0, 4
	la $a0, string1
	syscall 
	li $v0, 5
	syscall
	sw $v0, n
	la $s0, array
	add $t0, $t0, $s0
	sll $s1, $v0, 2
	add $s1, $s0, $s1
	li $v0, 4
	la $a0, string2
	syscall
loop:
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $t0, 4
	bne $s1, $t0, loop
	
	add $t0, $s0, $zero 
	add $t1, $s0, $zero
	
sort:
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	bne $t0, $t1, pass
	sw $t2, min
	sw $t1, vi_tri
	j continue
pass:	
	lw $t6, min
	slt $s2, $t3, $t6
	beq $s2, $zero,	continue
	sw $t3, min
	sw $t1, vi_tri
continue:
	addi $t1, $t1, 4
	bne $t1, $s1, sort
	lw $t4, min
	sw $t4, 0($t0)
	lw $t5, vi_tri
	sw $t2, 0($t5)
	addi $t0, $t0, 4
	add $t1, $t0, $zero
	bne $t0, $s1, sort	
	
	add $t0, $s0, $zero
	li $v0, 4
	la $a0, string3
	syscall
print:	
	li $v0, 1
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, space
	syscall
	addi $t0, $t0, 4
	bne $t0, $s1, print
	
	add $t0, $s0, $zero
	li $v0, 4
	la $a0, string4
	syscall
	addi $t1, $zero, 1
	lw $a0, 0($t0)
binary:	
	addi $t1, $t1, 1
	beq $t1, $a0, print_binary
	div $a0, $t1
	mfhi $t2
	bne $t2, $zero, binary
next:	
	addi $t1, $zero, 1	
	addi $t0, $t0, 4
	beq $t0, $s1, exit
	lw $a0, 0($t0)
	j binary
print_binary:	
	li $v0, 35
	syscall
	li $v0, 4
	la $a0, space
	syscall
	bne $t0, $s1, next
exit: