;
;	Complement the 32bit working register
;
	.export compleax

compleax:
	comb
	coma
	com @sreg+1
	com @sreg
	rts
