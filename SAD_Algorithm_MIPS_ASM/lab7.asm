#
# Calculate sum from A to B.
#
# Authors: 
#	X Y, Z Q 
#
# Group: ...
#

.text
main:
	#
	# Your code goes here...
	# read input
	
	
	addi	$t0, $zero, 5
	addi	$t1, $zero, 8
	# add one because $t1 is inclusive
	addi	$t1, $t1, 1
	addi	$t2, $zero, 0
loop:
	add	$t2, $t2, $t0
	addi	$t0, $t0, 1
	beq 	$t0, $t1, break_loop	
	j loop
break_loop:
	# Put your sum S into register $t2
end:	
	j	end	# Infinite loop at the end of the program. 
