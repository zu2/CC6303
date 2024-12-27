;
;	Left shift 32bit signed
;
	.export tosasleax
	.export tosshleax

	.code

;
;	TODO: optimize 8, 16 steps on asl and asr cases
;
tosasleax:	
tosshleax:
	tsx
	tstb
	beq	noshift
	cmpb	#32
	bcc	ret0
loop:
	asl	5,x
	rol	4,x
	rol	3,x
	rol	2,x
	decb
	bne loop
	; Get the value
	ldab	3,x
	stab	@sreg+1
	ldaa	2,x
	staa	@sreg
	ldab	5,x
	ldaa	4,x
	jmp pop4
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
