		.data
string:		.asciiz ""
		.text
main:	li $v0, 8
	la $a0, string
	li $a1, 256
	syscall
	li $v0, 4
	syscall
	