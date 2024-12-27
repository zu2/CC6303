;
;	isxdigit(unsigned char c)
;		return	(c>='0' && c<='9')
;		||	(c>='A' && c<='F')
;		||	(c>='a' && c<='f');
;
;
		.export _isxdigit

		.code

_isxdigit:
		clra
		tsx
		ldab 3,x
		cmpb #'0'
		bcs fail
		cmpb #'9'
		bls good
		cmpb #'A'
		bcs fail
		cmpb #'F'
		bls good
		cmpb #'a'
		bcs fail
		cmpb #'f'
		bls good
fail:		clrb
		; any non zero is 'good'
good:		jmp ret2
