
		.export _toupper

		.setcpu 6803
		.code

_toupper:
		tsx
		ldd 2,x
		tsta
		bne done
		cmpb #'a'
		blo done
		cmpb #'z'
		bhi done
		subb #$20
done:		rts
