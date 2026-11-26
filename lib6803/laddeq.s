	.code
	.export laddeqa
	.export laddeqysp
	.export laddeq

	.setcpu 6803

; X = S + 3 + X
laddeqysp:
	stx @tmp
	std @tmp2
	sts @tmp3
	ldd @tmp3
	addd @tmp
	addd #3
	std @tmp
	ldx @tmp
	ldd @tmp2

; (0-3,x) += sreg:D
; sreg:D = (0-3,x)
laddeqa:
laddeq:
	addd 2,x		; Add the low word
	std 2,x
	std @tmp
	; No adcd
	ldd ,x			; High word
	adcb @sreg+1		; 1,x + sreg+1 (byte 3)
	adca @sreg		; ,x + sreg (byte 4)
	std ,x
	std @sreg
	ldd @tmp
	rts
