
		.export _isalpha

		.code

_isalpha:
		clra
		tsx
		ldab 3,x
		cmpb #'A'
		blo fail
		cmpb #'Z'
		bls good
		cmpb #'a'
		blo fail
		cmpb #'z'
		bls good
fail:		clrb
		; any non zero is 'good'
good:		rts
