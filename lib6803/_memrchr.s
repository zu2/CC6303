		.export _memrchr
		.setcpu 6803
		.code

_memrchr:
		tsx
		ldd 6,x
		std @tmp2		; start of the search range
		addd 2,x
		std @tmp		; one byte past the search range
		ldab 5,x
		ldx @tmp
		bra memchrn
memrchrl:
		dex
		cmpb ,x
		beq strmatch
memchrn:
		cpx @tmp2
		bne memrchrl
		clra
		clrb
		rts
strmatch:
		stx @tmp
		ldd @tmp
		rts
