
		.export _isalnum

		.code

_isalnum:
		clra
		tsx
		ldab 3,x
		cmpb #'0'
		blo fail
		cmpb #'9'
		bls good
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
