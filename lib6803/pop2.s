

	.export pop2
	.export true2
	.export false2

	.setcpu 6803
	.code

false2:
	ldd @zero
	bra pop2
true2:
	ldd @one
pop2:
	pulx
	ins
	ins
	jmp ,x
