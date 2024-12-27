;
;	Right shift 32bit signed
;
	.export tosasreax

	.code

tosasreax:	
	cmpb	#32
	bcc	ret0
	tsx
	tstb
	beq noshift
loop:
	asr	2,x
	ror	3,x
	ror	4,x
	ror	5,x
	decb
	bne loop
	; Get the value
	ldab	3,x
	stab	@sreg+1
	ldaa	2,x
	staa	@sreg
	ldab	5,x
	ldaa	4,x
	jmp	pop4
ret0:
	clrb
	clra
	stab	@sreg+1
	staa	@sreg
	jmp	pop4
noshift:
	ldx	0,x
	ins
	ins
	pula
	staa	@sreg
	pulb
	stab	@sreg+1
	pula
	pulb
	jmp	0,x
