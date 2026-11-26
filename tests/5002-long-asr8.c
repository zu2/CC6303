static long shift(long value)
{
    return value >> 8;
}

int main(void)
{
    return (unsigned long)shift(-0x6DCBA95BL) != 0xFF923456UL;
}
