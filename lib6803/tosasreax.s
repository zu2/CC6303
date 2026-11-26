;
;	Right shift 32bit signed
;
	.export tosasreax

	.setcpu 6803
	.code

tosasreax:	
	cmpb	#32
	bcc	ret0
	tsx
	tstb
	beq result
loop:
	asr	2,x
	ror	3,x
	ror	4,x
	ror	5,x
	decb
	bne loop
result:
	ldd	2,x
	std	@sreg
	ldd	4,x
done:
	jmp pop4
ret0:
	clra
	clrb
	std	@sreg
	bra	done
