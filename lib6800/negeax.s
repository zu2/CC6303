;
;	Negate the working register
;
        .export negeax
        .code

negeax: com @sreg
        com @sreg+1
        coma
        comb
        addb #1
        adca #0
        bcc ret
        inc @sreg+1
        bne ret
        inc @sreg
ret:    rts
