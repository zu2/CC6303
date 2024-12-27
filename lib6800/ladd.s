;
;	Add top of stack to 32bit working accumulator, removing it from
;	the stack
;

	.code
	.export tosadd0ax
	.export tosaddeax

tosadd0ax:
	clr	sreg
	clr	sreg+1
tosaddeax:
	tsx
	addb	5,x
	adca	4,x
	pshb
	ldab	3,x
	adcb	@sreg+1
	stab	@sreg+1
	ldab	2,x
	adcb	@sreg
	stab	@sreg
	pulb
	jmp	pop4
