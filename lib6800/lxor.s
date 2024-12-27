;
;	Based on the 6502 runtime. CC68 is a bit different as we've got
;	better operations
;

	.code

	.export tosxor0ax
	.export tosxoreax

tosxor0ax:
	clr	sreg
	clr	sreg+1
;
;	xor D and @sreg with the top of stack (3,X as called)
;
tosxoreax:
	tsx
	eorb	5,x
	pshb
	eora	4,x
	ldab	@sreg+1
	eorb	3,x
	stab	@sreg+1
	ldab	@sreg
	eorb	2,x
	stab	@sreg
	pulb
	jmp	pop4
