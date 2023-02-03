.data
   intArray: .space 40          #Each int is 4 bit since we want have 10 int then we need to multiple 10 by 4.
.text
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Assigm the Integers in a Array ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
addi $t0, $zero, 1
addi $t1, $zero, 4
addi $t2, $zero, 9
addi $t3, $zero, 2
addi $t4, $zero, 10
addi $t5, $zero, 6
addi $t6, $zero, 7
addi $t7, $zero, 5
addi $s0, $zero, 3
addi $s1, $zero, 8
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ index  = s2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
addi $s2, $zero, 0
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Store Data ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sw $t0, intArray($s2)				#add int 1 to the array
     addi $s2, $s2, 4 				#add 4 bit to the index of array
sw $t1, intArray($s2)				#add int 4 to the array
     addi $s2, $s2, 4		
sw $t2, intArray($s2)				#add int 9 to the array
     addi $s2, $s2, 4			
sw $t3, intArray($s2)				#add int 2 to the array
     addi $s2, $s2, 4		
sw $t4, intArray($s2)				#add int 10 to the array
     addi $s2, $s2, 4		
sw $t5, intArray($s2)				#add int 6 to the array
     addi $s2, $s2, 4		
sw $t6, intArray($s2)				#add int 7 to the array
     addi $s2, $s2, 4		
sw $t7, intArray($s2)				#add int 5 to the array
     addi $s2, $s2, 4		
sw $s0, intArray($s2)				#add int 3 to the array
     addi $s2, $s2, 4		
sw $s1, intArray($s2)				#add int 8 to the array    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Sorting the Array ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
main:
    la  $t0, intArray			       # Copy the base address of your array into $t1
    add $t0, $t0, 40    		       # 4 bytes per int * 10 ints = 40 bytes          
    
    jal outterLoop
 
 end:
     li $v0, 10
     syscall                  
outterLoop:             		       # Used to determine when we are done iterating over the Array
    add $t1, $0, $0                  	       # $t1 holds a flag to determine when the list is sorted
    la  $a0, intArray    		       # Set $a0 to the base address of the Array
innerLoop:                		       # The inner loop will iterate over the Array checking if a swap is needed
    lw  $t2, 0($a0)       		       # sets $t0 to the current element in array
    lw  $t3, 4($a0)        		       # sets $t1 to the next element in array
    slt $t5, $t2, $t3      		       # $t5 = 1 if $t0 < $t1
    beq $t5, $0, continue 	               # if $t5 = 1, then swap them
    add $t1, $0, 1        		       # if we need to swap, we need to check the list again
    sw  $t2, 4($a0)         		       # store the greater numbers contents in the higher position in array (swap)
    sw  $t3, 0($a0)         		       # store the lesser numbers contents in the lower position in array (swap)
continue:
    addi $a0, $a0, 4         		       # advance the array to start at the next location from last time
    bne  $a0, $t0, innerLoop   	       # If $a0 != the end of Array, jump back to innerLoop
    bne  $t1, $0, outterLoop                 # $t1 = 1, another pass is needed, jump back to outterLoop


