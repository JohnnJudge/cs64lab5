# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    # TODO: Write your function code here
	addi $a1, -5
	li $t0, 4
	mult $a1, $t0
	mflo $a1
	move $v0, $a1
	jr $ra
routineA:
    # TODO: Write your function code here
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $t0, 3
	mult $a1, $t0
	mflo $a1
	jal routineB
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	li $t0, 2
	mult $a0, $t0
	mflo $a0
	add $a0, $a0, $v0
	move $s1, $a0
	move $a1, $s1
	addi $a1, $a1, -1
	addi $sp, $sp, -4
	sw $ra 0($sp)
	jal routineB
	lw $ra 0($sp)
	jr $ra

	

main:

	# TODO: Write your main function code here
	li $a0, 5
	li $a1, 7
	jal routineA
	move $s0, $v0
	li $v0, 1
	move $a0, $s0
	syscall
exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
