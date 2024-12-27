;
;	Baed on the 6303 version except that we lack xgdx so it's a little
;	bit uglier
;
;	This is the classic division algorithm
;
;	On entry D holds the divisor and X holds the dividend
;
;	work = 0
;	loop for each bit in size (tracked in tmp)
;		shift dividend left (X/@tmp2)
;		rotate left into work (D)
;		set low bit of dividend (X/@tmp2)
;		subtract divisor (@tmp1) from work
;		if work < 0
;			add divisor (@tmp1) back to work
;			clear lsb of @tmp2/x
;		end
;	end loop
;
;	On exit X holds the quotient, D holds the remainder
;
;
	.export div16x16

	.code

div16x16:
	; TODO - should be we spot div by 0 and trap out ?
	staa @tmp1		; divisor
	stab @tmp1+1
	clra
	clrb
	stx @tmp		; dividend
	ldx #16			; bit count
loop:
	asl @tmp+1		; shift dividend
	rol @tmp
	rolb			; shift remainder
	rola
	subb @tmp1+1		; divisor
	sbca @tmp1
	bcc skip
	addb @tmp1+1
	adca @tmp1
	inc @tmp+1		; set low bit
skip:
	dex
	bne loop
	; When calculating the quotient, the meaning of the bits is inverted.
	; Finally, we correct it with com. This saves 6*(16-2)=84 cycles.
	com @tmp+1
	com @tmp
	ldx @tmp
	rts
