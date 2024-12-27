;
;	int toupper(int c)
;		return (c>='a' && c<='z')? c-'a'+'A': c;
;
;
		.export _toupper

		.code

_toupper:
		clra
		tsx
		ldab 3,x
		cmpb #'a'
		bcs done
		cmpb #'z'
		bhi done
		subb #$20
done:		jmp ret2
