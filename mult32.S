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
masks	DCD		0x0000ffff , 0xffff0000
		ADR		r0, masks ;get masks
		LDR		r1, [r0], #4 ; load mask 0x0000ffff
		LDR		r2, [r0] ; load mask 0xffff0000
		ADR		r0, numbers ;load numbers into memory
		LDR		r3, [r0], #4 ; load mulitpicand
		LDR		r4, [r0] ; load multiplier
		AND		r5, r3, r1 ; get top half of multipicand
		AND		r3, r3, r2 ; get bottom half of multipicand
		AND		r6, r4, r1 ; get top half of multiplier
		AND		r4, r4, r2 ; get bottom half of multiplier
		MOV		r1, r5     ; make use of mask registers now that I don't need them
		MOV		r2, r6     ; make use of mask registers now that I don't need them
		MOV		r5, #0 ; set for top half of temp result
		MOV		r6, #0 ; set for bottom half of temp result
		
main
		
		MOV		r7 , r4 ; move bottom multipler into generic register
		MOV		r8, r3 ; move bottom multicand into generic register
		
		
		
		
		
		
		
		
mul
		TST		r7, #1 ; check least siginfcant bit of  generic multiplier
		ADDNE	r9, r9,r8 ; if 1 add multpicand to result
		ADDCS	r10,r10, #1 ; add if carry
shift
		MOV		r8, r8 , lsl #1 ;bit shift multpicand left by 1 bit
		MOV		r7, r7, lsr #1 ;bit shift multiper right by 1 bit
		SUB		r4, r4 , #1   ;subtract one bit from counter
		CMP		r7, #0 ; stop at N
		BNE		mul
		
