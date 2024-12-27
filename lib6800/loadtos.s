	.export loadtos
	.export savetos
	.export addtotos
	.export addtotosb

	.code

loadtos:
	tsx
	ldab 3,x
	ldaa 2,x
	inx			; so X is as the caller expects it
	inx
	rts

savetos:
	tsx
	stab 3,x
	staa 2,x
	inx			; so X is as the caller expects it
	inx
	rts

addtotosb:
	clra
addtotos:
	tsx
	addb 3,x
	adca 2,x
	stab 3,x
	staa 2,x
	inx
	inx
	rts
