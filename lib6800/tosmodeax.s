;
;	Signed 32bit remainder TOS by sreg:d
;
;	C99 says that the sign of the remainder shall be the sign of the
;	dividend, older C says nothing but it seems unwise to do other
;	things
;

		.export tosmodeax
		.code

tosmodeax:
		; make working space
		psha
		; Arrange stack for the divide helper. TOS is already right
		; so push the other 4 bytes we need. The divide helper knows
		; about the fact there is junk (return address) between the
		; two
		ldaa @sreg
		staa @tmp4
		bpl nosignfix
		jsr negeax
nosignfix:
		pula
		pshb
		psha
		ldaa @sreg
		ldab @sreg+1
		pshb
		psha
		;
		;	Sign rules
		;
		ldaa 10,x		; sign of TOS
		bpl nosignfix2
		ldaa 9,x
		ldab 10,x
		subb #1
		sbca #0
		staa 9,x
		stab 10,x
		ldaa 7,x
		ldab 8,x
		sbcb #0
		sbca #0
		coma
		comb
		staa 7,x
		stab 8,x
		com 9,x
		com 10,x
nosignfix2:
		tsx
		jsr div32x32
		ins
		ins
		ins
		ins
		;
		;	At this point @tmp2/@tmp3 hold the positive signed
		;	dividend
		;
		ldaa @tmp2
		ldab @tmp2+1
		staa @sreg
		stab @sreg+1
		ldaa @tmp4
		bita #0x80		; check if negative dividend
		beq nonega
		ldaa @tmp3
		ldab @tmp3+1
		jsr negeax
		jmp pop4
nonega:
		ldaa @tmp3
		ldab @tmp3+1
		jmp pop4
