;
;	int tolower(int c)
;		return (c>='A' && c<='Z')? c-'A'+'a': c;
;
;
		.export _tolower

		.code

_tolower:
		tsx
		ldab 3,x
		ldaa 2,x
		bne done
		cmpb #'A'
		bcs done
		cmpb #'Z'
		bhi done
		addb #$20
done:		jmp ret2
