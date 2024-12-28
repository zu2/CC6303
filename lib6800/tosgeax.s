;
;	Compare top of stack with D
;

		.export tosgeax
		.code
tosgeax:
		tsx
		subb 3,x
		sbca 2,x
		blt true
		bgt false
		tstb
		bne false
true:
		jmp true2
false:
		jmp false2
