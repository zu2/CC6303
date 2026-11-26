static long shift(long value, unsigned int count)
{
    return value >> count;
}

int main(void)
{
    return shift(0x12345678L, 0) != 0x12345678L;
}
