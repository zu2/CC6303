
	.export tossubax


	.code
;
;	D = TOS - D
;
tossubax:
	nega		; negate D
	negb
	sbca #0
	tsx
	addb 3,x	; top of maths stack as seen by caller
	adca 2,x
	jmp pop2
