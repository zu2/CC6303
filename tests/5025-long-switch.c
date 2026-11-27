static int select(unsigned long value)
{
    switch (value) {
        case 0x11345678UL: return 1;
        case 0x81345678UL: return 2;
        case 0x81805678UL: return 3;
        default: return 0;
    }
}

int main(void)
{
    if (select(0x81345678UL) != 2)
        return 1;
    return select(0x81805678UL) != 3;
}
