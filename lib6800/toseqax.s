;
;	Compare top of stack with D
;

		.export toseqax
		.code
toseqax:
		tsx
		cmpb 3,x
		bne false
		cmpa 2,x
		bne false
true:
		jmp true2
false:
		jmp false2
