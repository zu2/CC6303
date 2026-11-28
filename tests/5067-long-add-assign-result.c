static unsigned long total = 0x12FFFFFFUL;
static unsigned long step = 0x10001UL;

int main(void)
{
    if ((total += 1) != 0x13000000UL || total != 0x13000000UL)
        return 1;
    if ((total += 0x1234) != 0x13001234UL || total != 0x13001234UL)
        return 2;
    return (total += step) != 0x13011235UL || total != 0x13011235UL;
}
