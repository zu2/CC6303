;
;	Compare top of stack with D
;
;	True if TOS < D. We actually check this as D > TOS
;
		.export tosultax
		.code
tosultax:
		tsx
		cmpa 2,x
		bne noteq
		cmpb 3,x
noteq:		bhi ret1
		jmp false2
ret1:		jmp true2
