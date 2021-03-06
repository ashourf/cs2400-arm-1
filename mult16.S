		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" words.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		2000, 20000
result	FILL		4
carry	FILL		8
		
		ADR		r0, numbers ;load numbers into memory
		LDR		r1, [r0], #4
		LDR		r2, [r0]
		ADR		r3, result ;load result block into memory
		MOV		r4, #16 ; create counter
		MOV		r5 , #0
		ADR		r6, carry ; load carry memory block
		MOV		r7, #0 ; temp locations for result
		MOV		r8, #0 ; temp location for carry.
main
		TST		r2, #1 ; check least siginfcant bit of multiplier
		ADDNE	r7, r7,r1 ; if 1 add multpicand to result
		ADDCS	r8,r8, #1 ; add if carry
shift
		MOV		r1, r1 , lsl #1 ;bit shift multpicand left by 1 bit
		MOV		r2, r2, lsr #1 ;bit shift multiper right by 1 bit
		SUB		r4, r4 , #1   ;subtract one bit from counter
		CMP		r4, #0 ; stop at N
		BNE		main
		STR		r7, [r3] ; store in result fill
		STR		r8, [r6] ; store carry in carry
		END
		
