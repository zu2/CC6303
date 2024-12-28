;
;	Compare top of stack with D
;

		.export tosneax
		.code
tosneax:
		tsx
		cmpb 3,x
		bne true
		cmpa 2,x
		beq false
true:
		jmp true2
false:
		jmp false2
