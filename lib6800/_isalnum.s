
		.export _isalnum

		.code

_isalnum:
		clra
		tsx
		ldab 3,x
		cmpb #'0'
		bcs fail
		cmpb #'9'
		bls good
		cmpb #'A'
		bcs fail
		cmpb #'Z'
		bls good
		cmpb #'a'
		bcs fail
		cmpb #'z'
		bls good
fail:		clrb
		; any non zero is 'good'
good:		jmp ret2
