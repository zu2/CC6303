	.export _strncmp
	.code

_strncmp:
	tsx
	ldab	3,x
	ldaa	2,x
	addb	7,x
	adca	6,x
	stab	@tmp3+1
	staa	@tmp3		; s1 + n
	ldx	4,x
	stx	@tmp
	tsx
	ldx	6,x
	bra	checkend
cmploop:
	inx
	stx	@tmp
	ldx	@tmp2
checkend:
	cpx	@tmp3
	beq	cmpeq
	ldab	,x
	inx
	stx	@tmp2
	ldx	@tmp
	cmpb	,x
	bne	cmpend
	tstb
	bne	cmploop
cmpeq:
	clrb
	clra
	jmp	ret6
cmpend:
	bcs	cmplt
	clra
	ldab	#1
	jmp	ret6
cmplt:
	ldab	#$ff
	tba
	jmp	ret6
