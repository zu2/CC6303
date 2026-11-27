unsigned int _cpu_to_le16(unsigned int);
unsigned int _le16_to_cpu(unsigned int);
unsigned int _cpu_to_be16(unsigned int);
unsigned int _be16_to_cpu(unsigned int);

int main(void)
{
    if (_cpu_to_le16(0x1234U) != 0x3412U)
        return 1;
    if (_le16_to_cpu(0x3412U) != 0x1234U)
        return 2;
    if (_cpu_to_be16(0x1234U) != 0x1234U)
        return 3;
    if (_be16_to_cpu(0x1234U) != 0x1234U)
        return 4;
    return 0;
}
