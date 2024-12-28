;
;	Compare top of stack with D
;

		.export tosltax
		.code
tosltax:
		tsx
		subb 3,x
		sbca 2,x
		bgt true
		blt false
		tstb
		bne true
false:
		jmp false2
true:
		jmp true2
