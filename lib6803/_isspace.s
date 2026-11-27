
		.export _isspace

		.code

_isspace:
		clra
		tsx
		ldab 3,x
		cmpb #' '
		beq good
		cmpb #9		; tab
		blo fail
		cmpb #13	; carriage return
		bls good
fail:		clrb
		; any non zero is 'good
good:		rts
