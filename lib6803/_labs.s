
		.export _labs

		.setcpu 6803
		.code

_labs:
		tsx
		ldd 2,x
		std @sreg
		bita #$80
		beq labsdone
		ldd 4,x
		jmp negeax
labsdone:
		ldd 4,x
		rts
