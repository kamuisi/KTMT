			.data
arr:			.space 5
n:			.word 5
			.text
			la $s1, arr
			lw $s0, n
			sll $t0, $s0, 2
			add $t0, $s1, $t0 #tao bien so sanh $t0
			add $t1, $s1, $zero #tao bien i
			add $t2, $s1, $zero #tao bien j
input:			li $v0, 5
			syscall
			sw $v0, 0($t1)
			addi $t1, $t1, 4
			bne $t1, $t0, input #i da chay het array chua	
			add $t1, $s1, $zero #set lai bien i		
selection_sort: 	lw $t3, 0($t1)#lay gia tri o A[i]
			beq $t8, $zero, save_min #min xuat hien chua
			slt $t5, $t3, $t6 #xem coi min con la min hay khong
			beq $t5, $zero, next
save_min:		lw $t6, 0($t1) #lay gia tri min va dia chi min
			add $t7, $t1, $zero
			addi $t8, $zero, 1 #min da xuat hien
next:			addi $t1, $t1, 4 #dich i den o nho tiep theos
			bne $t1, $t0, selection_sort  #kiem tra i da toi cuoi mang A chua
swap:			beq $t8, $zero, add_j #min da xuat hien chua
			lw $t4, 0($t2)    #lay gia tri o A[j]
			sw $t6, 0($t2)
			sw $t4, 0($t7)
add_j:			addi $t2, $t2, 4 #dua j sang o nho tiep theo
			add $t1, $t2, $zero # set i bang o nho j
			addi $t8, $zero, 0 #set xuat hien min = 0
			bne $t2, $t0, selection_sort #j da chay het array chua
			add $t1, $s1, $zero #set lai bien i
			li $v0, 1
output:			lw $a0, 0($t1)
			syscall
			addi $t1, $t1, 16
			lw $a0, 0($t1)
			syscall	
	
