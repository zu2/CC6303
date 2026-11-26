static unsigned long shift(unsigned long value)
{
    return value << 24;
}

int main(void)
{
    return shift(0x23UL) != 0x23000000UL;
}
