unsigned long _cpu_to_le32(unsigned long);
unsigned long _le32_to_cpu(unsigned long);
unsigned long _cpu_to_be32(unsigned long);
unsigned long _be32_to_cpu(unsigned long);

int main(void)
{
    if (_cpu_to_le32(0x12345678UL) != 0x78563412UL)
        return 1;
    if (_le32_to_cpu(0x78563412UL) != 0x12345678UL)
        return 2;
    if (_cpu_to_be32(0x12345678UL) != 0x12345678UL)
        return 3;
    if (_be32_to_cpu(0x12345678UL) != 0x12345678UL)
        return 4;
    return 0;
}
