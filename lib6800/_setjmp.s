	.export __setjmp
	.code

__setjmp:
	tsx
	ldaa	,x
	ldab	1,x
	ldx	2,x
	sts	,x
	staa	2,x
	stab	3,x
	ldaa	@fp
	ldab	@fp+1
	staa	4,x
	stab	5,x
	ldaa	@reg
	ldab	@reg+1
	staa	6,x
	stab	7,x
	ldaa	@reg+2
	ldab	@reg+3
	staa	8,x
	stab	9,x
	ldaa	@reg+4
	ldab	@reg+5
	staa	10,x
	stab	11,x
	clra
	clrb
	jmp	ret2
