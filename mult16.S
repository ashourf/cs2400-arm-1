		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" words.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		10, 15
result	FILL		4
carry	FILL		4
		
		ADR		r0, numbers ;load numbers into memory
		LDR		r1, [r0], #4
		LDR		r2, [r0]
		ADR		r3, result ;load result block into memory
		LDR		r3, [r3]
		MOV		r4, #16 ; create counter
		MOV		r5 , #0
main
		ANDS		r5,r2, #0b1 ; check least siginfcant bit of multiplier
		ADDGT	r3, r3,r1 ; if 1 add multpicand to result 
		BLT		shift     ; else branch to shift 
		
		
		
		
shift
		MOV		r1, r1 , lsl #1
		
		
		
		
		
