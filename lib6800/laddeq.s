;
;	On entry X points to the object
;
;	FIXME: need a review and rewrite as we sort out the 680x calling
;	conventions for this versus 6502
;
	.code
	.export laddeqa
	.export laddeqysp
	.export laddeq

; In this form X is the stack offset. Turn that into X is a pointer and
; fall into the static form
; (IX),SP += @sreg:D
laddeqysp:
	stx @tmp	; IX = IX+SP+3
	sts @tmp2
	pshb
	psha
	ldab @tmp2+1
	ldaa @tmp2
	addb @tmp+1
	adca @tmp
	addb #3
	adca #0
	stab @tmp+1
	staa @tmp
	ldx @tmp
	pula
	pulb
	bra laddeq
laddeqa:
	clr @tmp+1
	clr @tmp
; (0-3,x) += @sreg:D
; @sreg:D = (0-3,x)
laddeq:
	addb 3,x
	stab 3,x
	adca 2,x
	staa 2,x
	pshb
	psha
	ldab @sreg+1
	adcb 1,x
	stab 1,x
	stab @sreg+1
	ldaa @sreg
	adca 0,x
	staa 0,x
	staa @sreg
	pula
	pulb
	rts
