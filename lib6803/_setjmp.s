	.export __setjmp
	.setcpu 6803
	.code

__setjmp:
	tsx
	ldd	,x
	ldx	2,x
	sts	,x
	std	2,x
	ldd	@fp
	std	4,x
	ldd	@reg
	std	6,x
	ldd	@reg+2
	std	8,x
	ldd	@reg+4
	std	10,x
	clra
	clrb
	rts
