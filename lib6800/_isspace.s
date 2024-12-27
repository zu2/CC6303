;
;	isspace(unsigned char c)
;		return	(c==' ')  || (c=='\f') || (c=='\n') || (c=='\r')
;		||	(c=='\t') || (c=='\v');
;
;	->	return (c==' ') || (c>='\t' && c<='\r');
;
		.export _isspace
		.code
_isspace:
		clra
		tsx
		ldab 3,x
		cmpb #$20
		beq good
		cmpb #$09	; tab
		bcs fail
		cmpb #$0D	; CR
		bls good
fail:		clrb
		; any non zero is 'good
good:		jmp ret2
