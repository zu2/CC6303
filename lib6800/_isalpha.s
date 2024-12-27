
		.export _isalpha

		.code

_isalpha:
		clra
		tsx
		ldab 3,x
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
