;
;	int tolower(int c)
;		return (c>='A' && c<='Z')? c-'A'+'a': c;
;
;
		.export _tolower

		.code

_tolower:
		clra
		tsx
		ldab 3,x
		cmpb #'A'
		bcs done
		cmpb #'Z'
		bhi done
		addb #$20
done:		jmp ret2
