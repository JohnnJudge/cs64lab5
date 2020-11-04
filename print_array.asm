# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
arr: .word 1 2 3 4 5 6 7 8 9 10	
contents: .asciiz "The contents of the array are:\n"
new: .asciiz "\n"
.text
printA:
    li $t0, 0
loop:
    bge $t0, $a1, endloop
    li $v0, 1
    sll $t1, $t0, 2
    add $t2, $t1, $a0
    lw $t3, 0($t2)
	move $t4, $a0
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, new
	syscall
	move $a0, $t4
	
    addi $t0, $t0, 1
    j loop
endloop:
	jr $ra

main:

	la $a0, contents
	li $a1, 10
	li $v0, 4
	syscall
	la $a0, arr
	jal printA

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
