			;		ARM Programming Assignment #1: Capitalizer
			;
			;		Write a program that goes through the characters in chars,
			;		and Capitalizes every lower-case letter that it finds.
			;		Assume you are given the count of array elements.
			;		Write the number of capitalizations the program performed
			;		In the caps "fill" memory provided.
			
			;		Your code here
			
chars		DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
count		DCD		11
caps			FILL		4
			ADR		r0 , chars
			ADR		r1, count
			LDR		r2, [r1]
			
loop
			LDR		r4, [r0] ;get first value
			CMP		r4, #97 ; compare value to 97 the first ascii lower case letter
			BGE		capitalize ; if greater than or eqoual too branch 
			STR		r4, [r0], #4  ; move to the next value
			SUBS		r2, r2, #1 ; subtract one value from loop counter
			BNE		loop       ; loop
			END                  ; end of program 
			
			
			
			
			
			
capitalize
			CMP		r4, #122  ; check for 122
			SUBLE	r4, r4, #34 ; if less than or eqal to 122 subtract 
			
			
