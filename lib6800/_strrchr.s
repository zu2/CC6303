	.export _strrchr
	.code

_strrchr:
	ldx	#0
	stx	@tmp		; last match, or NULL
	tsx
	ldab	3,x		; c
	ldx	4,x		; s
	dex
loop:
	inx
	ldaa	,x
	cba
	bne	next
	stx	@tmp
next:
	tsta
	bne	loop
	ldaa	@tmp
	ldab	@tmp+1
	jmp	ret4
