;
;	Compare top of stack with D
;

		.export tosleax
		.code
tosleax:
		tsx
		subb 3,x
		sbca 2,x
		blt false
true:
		jmp true2
false:
		jmp false2
