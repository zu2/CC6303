static long shift(long value)
{
    return value >> 16;
}

int main(void)
{
    return (unsigned long)shift(-0x6DCBA95BL) != 0xFFFF9234UL;
}
