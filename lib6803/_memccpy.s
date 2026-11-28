
		.export _memccpy
		.setcpu 6803
		.code
_memccpy:
		tsx
		ldd 2,x
		beq nomatch
		addd 6,x
		std @tmp	; source + n
		ldd 8,x
		std @tmp2	; save 
		ldab 5,x	; match char
		ldx 6,x		; get source int X
loop:		ldaa ,x		; get a source byte
		stx @tmp3
		ldx @tmp2
		staa ,x		; save it
		inx
		stx @tmp2	; swap back
		ldx @tmp3
		cba		; did we match
		beq match
		inx
		cpx @tmp	; are we done ?
		bne loop
nomatch:
		clra
		clrb
		rts
match:		ldd @tmp2
		rts
