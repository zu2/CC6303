;
;	Compare top of stack with D
;

		.export tosgtax
		.code
tosgtax:
		tsx
		subb 3,x
		sbca 2,x
		bge false
true:
		jmp true2
false:
		jmp false2

