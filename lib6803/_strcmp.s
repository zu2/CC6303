		.export _strcmp
		.setcpu 6803
		.code
_strcmp:
		tsx
		ldd 2,x
		ldx 4,x
		std @tmp
		bra cmpbegin
loop:
		inx
		stx @tmp
		ldx @tmp2
		inx
cmpbegin:
		ldab ,x
		stx @tmp2
		ldx @tmp
		cmpb ,x
		bne cmpend
		tstb
		bne loop
		clra
		rts
cmpend:
		blo retminus1
		ldd @one
		rts
retminus1:
		ldd #-1
		rts

		
