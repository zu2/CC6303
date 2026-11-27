;
;	Another one that's really hard to do nicely
;

	.export _strcat

	.setcpu 6303
	.code

_strcat:
	tsx
	ldx	4,x		; dest
	dex
endhunt:
	inx
	tst	,x
	bne	endhunt
	stx	@tmp
	tsx
	ldx	2,x		; src
copyloop:
	ldaa	,x
	inx
	pshx
	ldx	@tmp
	staa	,x
	inx
	stx	@tmp
	pulx
	tsta
	bne copyloop
	tsx
	ldd	4,x
	rts
