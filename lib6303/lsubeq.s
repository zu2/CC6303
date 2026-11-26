	.code
	.export lsubeq
	.export lsubeqa
	.export lsubeqysp
	.setcpu 6303

; X = S + 3 + X
lsubeqysp:
	stx @tmp
	tsx
	xgdx
	addd @tmp
	addd #2
	xgdx

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
lsubeqa:
	clr @sreg
	clr @sreg+1
	bra lsubeq
