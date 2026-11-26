	.code
	.export lsubeq
	.export lsubeqa
	.export lsubeqysp
	.setcpu 6803

; X = S + 3 + X
lsubeqysp:
	stx @tmp
	std @tmp2
	sts @tmp3
	ldd @tmp3
	addd @tmp
	addd #3
	std @tmp
	ldx @tmp
	ldd @tmp2

; (0-3,x) -= sreg:D
; sreg:D = (0-3,x)
lsubeq:
	std @tmp
	ldd 2,x
	subd @tmp
	std 2,x
	std @tmp
	ldd ,x
	sbcb @sreg+1
	sbca @sreg
	std ,x
	std @sreg
	ldd @tmp
	rts
;
;	Same as lsubeq but with a 16bit value to subtract
;
lsubeqa:
	clr @sreg
	clr @sreg+1
	bra lsubeq
