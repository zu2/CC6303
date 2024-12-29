;
;	Compare top of stack with D
;
;	TOS <= D ?
;

		.export tosugeax
		.code
tosugeax:
		tsx
		cmpa 2,x
		bne noteq
		cmpb 3,x
noteq:
		bls ret1
		jmp false2
ret1:		jmp true2
