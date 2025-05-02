.text
main:
        # Lab Report 7
        # We assume we get 6 args and not 2 for the function like in lab7 
        # to make the testing environment simpler we just implemented the function itself
        # with taking 6 parameters and how this works with the default 4 provided registers
        # Thats why it can be tested and made sure it works

        # We use all 4 available parameters
        li    $a0, 10         # R1
        li    $a1, 20         # G1
        li    $a2, 30         # B1
        li    $a3, 12         # R2


        # call the 6-arg color abs-diff
        jal   abs_diff_color



# int abs_diff_color(int R1, int G1, int B1,
#                    int R2, int G2, int B2);
#
# classic $aX hold first four args; 5th at 0($sp), 6th at 4($sp).
# Returns sum of absolute differences in $v0.
# We use the stack to save and restore registers to use them as arguments
abs_diff_color:

        # carve out 8 bytes for G2,B2 (as each only really need 4 bytes)
        # the guiding example is used from Harris&Harris CodeExample 6.25
        addi  $sp, $sp, -8    # We make space on the stack to store two registers
        li    $t0, 18         # t0 will be G2 and t1 B2                  
        sw    $t0, 4($sp)    # G2 = 18 
        li    $t1, 31
        sw    $t1, 0($sp)    # B2 = 31

        # with setup done we perform the same/updated version of classical function

        # |R1-R2|
        sub  $t2, $a0, $a3
        sra  $t3, $t2, 31
        xor  $t2, $t2, $t3
        sub  $t2, $t2, $t3

        # |G1-G2|
        sub  $t4, $a1, $t0
        sra  $t5, $t4, 31
        xor  $t4, $t4, $t5
        sub  $t4, $t4, $t5

        # |B1-B2|
        sub  $t6, $a2, $t1
        sra  $t7, $t6, 31
        xor  $t6, $t6, $t7
        sub  $t6, $t6, $t7

        # sum them
        add  $v0, $t2, $t4
        add  $v0, $v0, $t6
        
        # Restore respective regs from stack
        lw   $t1, 0($sp)       # B2
        lw   $t0, 4($sp)       # G2
        
        # dealloc stack space and then return to caller
        addi  $sp, $sp, 8
        jr   $ra
