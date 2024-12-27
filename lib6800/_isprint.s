;
;	isprint(unsigned char c)
;		return (c>=0x20) && (c<=0x7e);
;
		.export _isprint

		.code

_isprint:
		clra
		tsx
		ldab 3,x
		cmpb #$20
		bcs fail
		cmpb #$7f
		bcc fail
		; Any non zero value is valid
		jmp ret2
fail:		clrb
		jmp ret2
