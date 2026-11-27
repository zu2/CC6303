
		.export _tolower

		.setcpu 6803
		.code

_tolower:
		tsx
		ldd 2,x
		tsta
		bne done
		cmpb #'A'
		blo done
		cmpb #'Z'
		bhi done
		addb #$20
done:		rts
