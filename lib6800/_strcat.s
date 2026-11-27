	.export _strcat
	.code

_strcat:
	tsx
	ldx	4,x		; dest
	dex
findend:
	inx
	tst	,x
	bne	findend
	jmp	strcpyx
