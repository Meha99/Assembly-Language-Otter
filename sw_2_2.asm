	lw x1 0x10010000          # load input value
	addi x2 x0 0x04           # initialise 4
        sub x3 x1 x2              # subtracts 4 from the number and stores it in x3 -> x1-x2
div4:   sub x3 x3 x2              # subtract 4 from x3 register
	bgeu x3 x2 div4           # check if further subtractio is possible-> input>4
	beqz x3 equal1            # compares the remainder of input/4 is equal to 0
	addi x4 x0 0x02           # initialises 2
        sub x6 x1 x4              # subtracts 2 from the input and stores it in x6->x1-x5
div2:   sub x6 x6 x4              # subtracts 2 from x6 and replaces x6 with the new value
	bgtu x6 x4 div2           # check if further subtraction is possible-> input>2
	beqz x6 equal2            # checks if the remainder in i/2 equals 0
	li x8 0xfff               # initialises 4095
	add x8 x8 x1              # adds 4095 to input and stores it in x8
        addi x7 x0 0x0            # initialises quotient
div3:	sub x8 x8 x4              # subtracts 2 from x8
	addi x7 x7 0x1            # increases the quotient by 1
	bgtu x8 x4 div3           # checks if further subtraction is possible -> x8>2
	sw x7 0x10010040 x10      # saves the answer in memory
end:    j end
        addi x9 x0 0x1            # initialises 1
equal2:	sub x8 x1 x9              # subtracts 1 from 09
	sw x8 0x10010040 x10      # stores the number in memory
	j end
equal1: not x8 x1                 # inverts bits of the given number 
	sw x8 0x10010040 x10      # stores the number in memory
        
	
