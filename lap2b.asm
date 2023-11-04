		.data
so1:		.asciiz "So thu nhat: "
so2:		.asciiz "So thu hai: "
string0:	.asciiz "Hai so bang nhau\n"
string1: 	.asciiz "so thu nhat lon hon\n"
string2:	.asciiz "so thu hai lon hon\n"
tong:		.asciiz "Tong: "
hieu:		.asciiz "\nHieu: "
tich:		.asciiz "\nTich: "
thuong:		.asciiz "\nThuong: "
du:		.asciiz " Du: "
		.text
		li $v0, 4
		la $a0, so1
		syscall
		li $v0, 5
		syscall
		add $s0, $v0, $zero
		li $v0, 4
		la $a0, so2
		syscall
		li $v0, 5
		syscall
		add $s1, $v0, $zero
		li $v0, 4
		sub $t0, $s0, $s1
		add $t2, $t0, $zero
		beq $t0, $zero, hai_so_bang_nhau
		slti $t0, $t0, 0
		bne $t0, $zero, so_thu_hai_lon_hon
		la $a0, string1
		syscall
		j exit
hai_so_bang_nhau:	la $a0, string0
			syscall
			j exit
so_thu_hai_lon_hon:	la $a0, string2
			syscall
			j exit
exit:		li $v0, 4
		la $a0, tong
		syscall
		add $a0, $s0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, hieu
		syscall
		add $a0, $t2, $zero
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, tich
		syscall
		mult $s0, $s1
		mflo $a0
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, thuong
		syscall
		div $s0, $s1
		mflo $a0
		li $v0, 1 
		syscall
		li $v0, 4
		la $a0, du
		syscall
		li $v0, 1
		mfhi $a0
		syscall
	
