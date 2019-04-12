		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" words.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		10, 12
result	FILL		4
carry	FILL		4
		
		
start
		ADR		r0, numbers  ;load numbers into register r0
		LDR		r1, [r0], #4 ;load multiplicand into r1
		LDR		r2, [r0], #4 ;load multipiler into r2
		MOV		r3,#0   ; set product to zero
loop
		MOVS		r2, r2, LSR #1
		ADDCS	r3, r3 ,r1
		MOV		r1, r1,LSL #1
		CMP		r2, #0
		BGT		loop
		ADR		r0, result
		STR		r3, [r0]
		
		
		
		
		
