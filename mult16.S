		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" words.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0b1100101010010001, 0b1111010101000011, 0b0000000000000000
result	FILL		4
carry	FILL		4
bcounter	DCD		16 ;bitcounter
		
start
		ADR		r0, numbers  ;load numbers into register r0
		LDR		r1, [r0], #4 ;load multiplicand into r1
		LDR		r2, [r0], #4 ;load multipiler into r2
		LDR		r3, [r0], #4  ; set product to zero
		LDR		r4, [r0] ; set partial sum to zero
		ADR		r5, bcounter
		LDR		r5,[r5] ;load counter into memory
loop
		AND		r6, r1, #0b1
		
		
		
		
