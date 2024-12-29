;
;	TOS (2-5,x) == sreg:D ?
;

	.code
	.export toseqeax

toseqeax:
	tsx
	cmpb 5,x
	bne ret0
	cmpa 4,x
	bne ret0
	ldx 2,x
	cpx @sreg
	bne ret0
ret1:	jmp true4
ret0:	jmp false4
