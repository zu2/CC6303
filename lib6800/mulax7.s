;
;	Multiply D by 7
;
	.export mulax7

	.setcpu 6800
	.code

mulax7:
	stab @tmp1+1
	staa @tmp1
	lslb		; x2
	rola
	lslb		; x4
	rola
	lslb		; x8
	rola
	subb @tmp1+1	; x7 (x8-x1)
	sbca @tmp1
	rts
