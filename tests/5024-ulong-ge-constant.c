static unsigned long value = 0x80000000UL;

int main(void)
{
    return (value >= 0x12345678UL) != 1;
}
