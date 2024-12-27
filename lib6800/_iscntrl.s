;
;	iscntrl(unsigned char c)
;		return (c <= 0x1f) || (c == 0x7f);
;
		.export _iscntrl

		.code

_iscntrl:
		clra
		tsx
		ldab 3,x
		cmpb #$20
		bcs ok
		cmpb #$7F
		bne fail
ok:
		ldab #1
		jmp ret2
fail:		clrb
		jmp ret2
