;
;	6803 lacks xgdx... 6800 lacks pulx
;
;	Swap top of stack and AB
;
	.code
	.export swapstk

swapstk:
	tsx
	ldx 2,x		; get TOS
	stx @tmp	; and save it
	tsx
	stab 3,x	; store D into TOS
	staa 2,x
	ldab @tmp+1	; get old TOS
	ldaa @tmp
	rts
