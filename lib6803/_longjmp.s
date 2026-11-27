
	.export	_longjmp

	.setcpu 6803
	.code

_longjmp:
	tsx
	ldx	4,x
	ldd	4,x
	std	@fp
	ldd	6,x
	std	@reg
	ldd	8,x
	std	@reg+2
	ldd	10,x
	std	@reg+4
	tsx
	ldd	2,x
	bne	retok
	incb
retok:
	ldx	4,x
	lds	,x
	ldx	2,x
	ins
	ins
	jmp	,x
