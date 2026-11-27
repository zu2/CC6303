
	.export	_longjmp

	.code

_longjmp:
	tsx
	ldx	4,x
	ldaa	4,x
	ldab	5,x
	staa	@fp
	stab	@fp+1
	ldaa	6,x
	ldab	7,x
	staa	@reg
	stab	@reg+1
	ldaa	8,x
	ldab	9,x
	staa	@reg+2
	stab	@reg+3
	ldaa	10,x
	ldab	11,x
	staa	@reg+4
	stab	@reg+5
	tsx
	ldab	3,x
	ldaa	2,x
	bne	retok
	tstb
	bne	retok
	incb
retok:
	ldx	4,x
	lds	,x
	ldx	2,x
	ins
	ins
	ins
	ins
	jmp	,x
