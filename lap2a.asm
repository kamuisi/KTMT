		.data
string:	        .asciiz "Invalid Type"
string0: 	.asciiz "Nhap ky tu (chi mot ky tu): "
string1:        .asciiz "\n Ky tu truoc: "
string2:   	.asciiz "\n Ky tu sau: " 
khong_co:	.asciiz "Khong co ky tu"
		.text
		li $v0, 4
		la $a0, string0
		syscall
		li $v0, 12
		syscall
		add $s0, $v0, $zero
		slti $t0, $s0, 58
		bne $t0, $zero, chu_so
		slti $t0, $s0, 91
		bne $t0, $zero, chu_hoa
		slti $t0, $s0, 123
		bne $t0, $zero, chu_thuong
Error:		li $v0, 55
		la $a0, string
		li $a1, 0
		syscall
		j exit
ko_co_ky_tu_truoc:	li $v0, 4
			la $a0, string1
			syscall
			la $a0, khong_co
			syscall
			la $a0, string2
			syscall
			li $v0, 11
			addi $a0, $s0, 1
			syscall
			j exit  
ko_co_ky_tu_sau:	li $v0, 4
			la $a0, string1
			syscall
			li $v0, 11
			addi $a0, $s0, -1
			syscall
			li $v0, 4
			la $a0, string2
			syscall
			la $a0, khong_co
			syscall
			j exit 
co_hai_ky_tu:		li $v0, 4
			la $a0, string1
			syscall
			li $v0, 11
			addi $a0, $s0, -1
			syscall
			li $v0, 4
			la $a0, string2
			syscall
			li $v0, 11
			addi $a0, $s0, 1
			syscall
			j exit 
chu_so:		addi $t0, $s0, -48
		slti $t1, $t0, 0
		bne $t1, $zero, Error
		beq $t0, $zero, ko_co_ky_tu_truoc
		addi $t0, $s0, -57
		beq $t0, $zero, ko_co_ky_tu_sau
		j co_hai_ky_tu
chu_hoa:	addi $t0, $s0, -65
		slti $t1, $t0, 0
		bne $t1, $zero, Error
		beq $t0, $zero, ko_co_ky_tu_truoc
		addi $t0, $s0, -90
		beq $t0, $zero, ko_co_ky_tu_sau
		j co_hai_ky_tu
chu_thuong:	addi $t0, $s0, -97
		slti $t1, $t0, 0
		bne $t1, $zero, Error
		beq $t0, $zero, ko_co_ky_tu_truoc
		addi $t0, $s0, -122
		beq $t0, $zero, ko_co_ky_tu_sau
		j co_hai_ky_tu
exit:
