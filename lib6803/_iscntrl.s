
		.export _iscntrl

		.code

_iscntrl:
		clra
		tsx
		ldab 3,x
		cmpb #32
		blo good
		cmpb #127
		bne fail
good:
		ldab #1
		rts
fail:		clrb
		rts
