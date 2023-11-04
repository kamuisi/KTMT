	.data
text_1:	.asciiz "Nhap so phan tu mang: "
text_2: .asciiz "Nhap gia tri tung phan tu mang:\n"
text_3: .asciiz "So nho nhat la: "
text_4: .asciiz "\nSo lon nhat la: "
text_5: .asciiz "\nTong gia tri cac phan tu trong mang: "
text_6: .asciiz "\nChi so phan tu can lay gia tri: "
text_7:	.asciiz "Gia tri cua phan tu la: "
sum:	.word 0
min: 	.word 0
max: 	.word 0
n:	.word 0
array: 	.word 0
	.text
#nhap mang
	la $s0, array
	la $t0, n
	la $a0, text_1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	sll $t0, $v0, 2
	add $t0, $t0, $s0
	la $a0, text_2
	li $v0, 4
	syscall
loop:
	li $v0, 5
	syscall 
	sw $v0, 0($s0)
	addi $s0, $s0, 4
	bne $s0, $t0, loop
#tim min max
	la $s2, min
	la $s3, max
	la $s0, array
	lw $t1, 0($s0)
	sw $t1, 0($s2)
	sw $t1, 0($s3)
min_max:
	lw $t1, 0($s0)
	lw $t2, 0($s2)
	lw $t3, 0($s3)
	addi $s0, $s0, 4
	slt $t4, $t1, $t2
	beq $t4, $zero, max_label
	sw $t1, 0($s2)
max_label:
	slt $t4, $t3, $t1
	beq $t4, $zero, ss
	sw $t1, 0($s3)
ss:	
	bne $t0, $s0, min_max	
#Tong phan tu cua mang
 	la $s4, sum
 	la $s0, array
 	lw $t5, 0($s4)
sum_loop:  	
  	lw $t6, 0($s0)
  	addi $s0, $s0, 4
  	add $t5, $t5, $t6
  	bne $s0, $t0, sum_loop
  	sw $t5, 0($s4)
#print
  	la $a0, text_3
	li $v0, 4
	syscall
	la $t2, min
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	la $a0, text_4
	li $v0, 4
	syscall
	la $t3, max
	lw $a0, 0($t3)
	li $v0, 1
	syscall
	la $a0, text_5
	li $v0, 4
	syscall
	la $t5, sum
	lw $a0, 0($t5)
	li $v0, 1
	syscall
	la $a0, text_6
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	la $s0, array 
	slt $t7, $v0, $t0
	beq $t7, $zero, exit
	addi $v0, $v0, -1
	sll $t7, $v0, 2
	add $t7, $s0, $t7
	li $v0, 4
	la $a0, text_7
	syscall
	lw $a0, 0($t7)
	li $v0, 1
	syscall
exit: 