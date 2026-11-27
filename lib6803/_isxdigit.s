
		.export _isxdigit

		.code

_isxdigit:
		clra
		tsx
		ldab 3,x
		cmpb #'0'
		blo fail
		cmpb #'9'
		bls good
		cmpb #'A'
		blo fail
		cmpb #'F'
		bls good
		cmpb #'a'
		blo fail
		cmpb #'f'
		bls good
fail:		clrb
		; any non zero is 'good'
good:		rts
