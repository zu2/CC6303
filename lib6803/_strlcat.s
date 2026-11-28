	.export _strlcat
	.setcpu 6803
	.code

_strlcat:
	tsx
	ldd	6,x
	addd	2,x
	std	@tmp3		; dest + size
	ldx	6,x
findend:
	cpx	@tmp3
	beq	append
	tst	,x
	beq	append
	inx
	bra	findend
append:
	jmp	strlcpyx
