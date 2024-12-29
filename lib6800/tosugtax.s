;
;	Compare top of stack with D
;
;	True if TOS > D, we actually check this as D < TOS
;

		.export tosugtax
		.code
tosugtax:
		tsx
		cmpa 2,x
		bne noteq
		cmpb 3,x
noteq:		
		bcs ret1
		jmp false2
ret1:		jmp true2
