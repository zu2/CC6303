;
;   TODO: meaning less?
;	Shouldn't we replace jsr jmpx to jsr 0,x ?
;
    .code
    .export jumpx

jumpx:
    jmp ,x
