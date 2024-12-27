;
;	Shift TOS left by D
;
	.export tosshlax		; unsigned
	.export tosaslax		; signed
	.export pop2get

	.code

; For 6303 it might be faster to load into D, shift in D using X as the
; count (as we can xgdx it in)
tosaslax:				; negative shift is not defined
					; anyway
tosshlax:
	tsx
	clra				; shift of > 15 is meaningless
	cmpb #15
	bgt shiftout
	tstb
	beq shiftdone
shloop:
	lsl 3,x
	rol 2,x
	decb
	bne shloop
shiftdone:
pop2get:
	tsx				; no pulx on original 6800
	ldx 0,x				; so do it by hand
	ins
	ins
	pula
	pulb
	jmp 0,x
shiftout:
	clr 3,x
	clr 2,x
	bra shiftdone
