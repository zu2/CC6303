;
;	Based on the 6502 runtime. CC68 is a bit different as we've got
;	better operations
;

	.code

	.export tosor0ax
	.export tosoreax

tosor0ax:
	clr	sreg
	clr	sreg+1
;
;	or D and @sreg with the top of stack (3,X as called)
;
tosoreax:
	tsx
	orab	5,x
	pshb
	oraa	4,x
	ldab	@sreg+1
	orab	3,x
	stab	@sreg+1
	ldab	@sreg
	orab	2,x
	stab	@sreg
	pulb
	jmp	pop4
