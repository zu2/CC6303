		.export laddeqstatic8
		.export laddeqstatic16
		.code

laddeqstatic8:
		clra

; (0-3,x) += D
; @sreg:D = (0-3,x)
laddeqstatic16:
		addb 3,x
		stab 3,x
		adca 2,x
		staa 2,x
		pshb
		psha
		ldab 1,x
		adcb #0
		stab 1,x
		stab @sreg+1
		ldaa ,x
		adca #0
		staa ,x
		staa @sreg
		pula
		pulb
		rts
