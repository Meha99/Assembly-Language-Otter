	lw x1 0x10010000             # loads the given unsigned value from memory address 0x10010000 and stores it in x1 memory adress
	li x2 0x8000                 # stores the value 32768 in the memory address x2
	addi x3 x0 0x04              # stores 4 in in x3 memory register
	bgeu x1 x2 loop              # branches off to "loop" branch if i>= 32768(x1>= x2)
	add x5 x1 x1                 # if the i>= 32768 is not true it will add itself to itself and put that value in x5
	sw  x5 0x10010040 x6         # stores the end value to memory address 0x10010000 
	j end          
loop:   addi x4 x0 0x0               # initialises the counter(quotient) to 0. This counter will count how many times 4 is subtracted from given number
divide: sub x1 x1 x3                 # subtracts 4 from the given number and replaces the existing number with this new number
	addi x4 x4 0x1               # increases the quotient by 1 
	bgeu x1 x3 divide	     # branches to divide branch if 4(x3) can still be subtracted from the number(x1). That is x1>=x3
	sw x4 0x10010040 x6  
end:    j end
