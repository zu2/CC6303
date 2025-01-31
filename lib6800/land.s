;
;	Based on the 6502 runtime. CC68 is a bit different as we've got
;	better operations
;

	.code

	.export tosand0ax
	.export tosandeax

tosand0ax:
	clr	sreg
	clr	sreg+1
;
;	and D and @sreg with the top of stack (3,X as called)
;
tosandeax:
	tsx
	andb	5,x
	anda	4,x
	pshb
	ldab	@sreg+1
	andb	3,x
	stab	@sreg+1
	ldab	@sreg
	andb	2,x
	stab	@sreg
	pulb
	jmp	pop4
