	.export _strlcat
	.setcpu 6800
	.code

_strlcat:
	tsx
	ldab	7,x
	ldaa	6,x
	addb	3,x
	adca	2,x
	stab	@tmp3+1
	staa	@tmp3		; dest + size
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
