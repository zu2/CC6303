static unsigned long shift(unsigned long value, unsigned int count)
{
    return value << count;
}

int main(void)
{
    return shift(0x12345678UL, 0) != 0x12345678UL;
}
