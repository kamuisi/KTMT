		.data
string1:	.asciiz "Chuoi Finonacci la: "
string2:	.asciiz "Nhap n: "
space:		.asciiz " "
n:		.word 0		
		.text

main:		li $v0, 4
		la $a0, string2
		syscall
		li $v0, 5
		syscall
		sw $v0, n
		li $v0, 4
		la $a0, string1
		syscall
		lw $a3, n
		addi $a1, $a1, 1     #so truoc
		add  $a2, $a2, $zero #tong
		jal fibonacci
		j exit
fibonacci:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		add $a0, $a2, $zero
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		add $t0, $a2, $zero
		add $a2, $a1, $a2
		add $a1, $t0, $zero
		addi $a3, $a3, -1
		slt $t1, $zero, $a3
		beq $a3, $zero, return
		jal fibonacci
return:		lw $ra, 0($sp)
		addi $sp, $sp, 4		
		jr $ra
exit:				
		
		
		
