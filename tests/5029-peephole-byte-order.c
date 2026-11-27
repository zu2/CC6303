static unsigned char bytes[9] = {0x12, 0x34, 0, 0, 0, 0, 0, 0x12, 0x34};
static unsigned int stored;

static unsigned int load_reversed(void)
{
    __asm__("ldab #<%v\n"
            "ldaa #>%v\n"
            "jsr dtox\n"
            "ldaa $01,x\n"
            "ldab $00,x", bytes, bytes);
    return __AX__;
}

static unsigned int store_reversed(void)
{
    __asm__("ldaa #$12\n"
            "ldab #$34\n"
            "staa @tmp2\n"
            "stab @tmp2+1\n"
            "ldab #<%v\n"
            "ldaa #>%v\n"
            "jsr dtox\n"
            "ldaa @tmp2\n"
            "ldab @tmp2+1\n"
            "staa $01,x\n"
            "stab $00,x", stored, stored);
    return stored;
}

static unsigned int store_and_push(void)
{
    __asm__("des\n"
            "des\n"
            "ldaa #$12\n"
            "ldab #$34\n"
            "tsx\n"
            "stab $01,x\n"
            "staa $00,x\n"
            "ldab $01,x\n"
            "ldaa $00,x\n"
            "pshb\n"
            "psha\n"
            "tsx\n"
            "ldaa $00,x\n"
            "ldab $01,x\n"
            "ins\n"
            "ins\n"
            "ins\n"
            "ins");
    return __AX__;
}

static unsigned int push_offset7_reversed(void)
{
    __asm__("ldx #%v\n"
            "ldab $07,x\n"
            "ldaa $07+1,x\n"
            "pshb\n"
            "psha\n"
            "tsx\n"
            "ldaa $00,x\n"
            "ldab $01,x\n"
            "ins\n"
            "ins", bytes);
    return __AX__;
}

int main(void)
{
    int failed = 0;
    if (load_reversed() != 0x3412U)
        failed |= 1;
    if (store_reversed() != 0x3412U)
        failed |= 2;
    if (store_and_push() != 0x1234U)
        failed |= 4;
    if (push_offset7_reversed() != 0x3412U)
        failed |= 8;
    return failed;
}
