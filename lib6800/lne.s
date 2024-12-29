;
;	TOS (2-5,x) == sreg:D ?
;

	.code
	.export tosneeax

tosneeax:
	tsx
	cmpb 5,x
	bne ret1
	cmpa 4,x
	bne ret1
	ldx 2,x
	cpx @sreg
	bne ret1
ret0:	jmp false4
ret1:	jmp true4
