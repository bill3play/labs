# Palindrome detection in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $s1, mesg         # get address of mesg to $s1
        addu       $s2, $s1,   $zero # $s2=$s1
loop:
        addiu      $s2, $s2,   1     # $s2=$s1 + 1
        lbu        $t0, 0($s2)       # get next character
        bne        $t0, $zero, loop  # repeat if char not '\0'
        # end of loop here

        addiu      $s2, $s2,  -1     # Adjust $s2 to point to last char

        ########################################################################

loop1:

	lbu $t0, 0($s1) # load first byte in $t0
	lbu $t1, 0($s2) # load first byte in $t1
	addi $s2, $s2, -1 # $s2 = $s2 - 1
	bne $t0, $t1 else # if($t0==$t1) goto else
	beq $t0, $zero, exit # if($t0!=$zero) goto exit
	addi $s1, $s1, 1 # $s1 = $s1 + 1
	j loop1
	
	
else: 
	addi $a0, $a0, 1
	
		
	
	
        ########################################################################

        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
###############################################################################

        .data
mesg:   .asciiz "racecar"
