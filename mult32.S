		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		;		answer with my defaults should be 4.611685935×10^18
		
numbers	DCD		0x7fffffda, 0x7fffffff
result	FILL		8
carry	FILL		4
masks	DCD		0x0000ffff
		ADR		r0, numbers ;load numbers into memory
		LDR		r1, [r0], #4 ; load multpicand
		LDR		r2, [r0] ; load multiplier
		MOV		r3, r1, lsr #16 ;  lower half of multipcand
		ADR		r0, masks ;get mask
		LDR		r0, [r0] ; load mask
		AND		r8, r0, r1 ; get upper half of multipcand
		MOV		r4, #0 ; upper half of result
		MOV		r5, #0 ;lower half of result
		MOV		r6, #32 ; load counter into register
main
		TST		r2, #1 ; check least siginfcant bit of multiplier
		ADDNE	r5, r5,r3 ; add lower multipcand to result
		ADCNE	r4,r4, r1 ; add upper multipicand to result
shift
		MOV		r3, r3 , lsl #1 ;bit shift lower multpicand left by 1 bit
		MOV		r8,r8, lsl #1 ;bit shit upper multipicand left by 1 bit
		MOV		r2, r2, lsr #1 ;bit shift multiplier right by 1 bit
		SUB		r6, r6 , #1   ;subtract one bit from counter
		CMP		r6, #0 ; stop at N
		BNE		main
		END
		
