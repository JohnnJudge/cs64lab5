# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    li $t0, 0
    li $t1, 5
    li $t2, 0
    li $t3, 3
loop:
	beq $t2, $t1, endloop
	add $t0, $t0, $a0
	add $t0, $t0, $a0
	sub $t0, $t0, $a1
	blt $a0, $t3, endif
	addi $a1, $a1, -1
endif:
	addi $a0, $a0, 1
	addi $t2, $t2, 1
	j loop

endloop:
	move $v0, $t0
	jr $ra

main:

	# TODO: Write your main function code here
	li $a0, 5
	li $a1, 7
	jal conv
	move $a0, $v0
	li $v0, 1
	syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
