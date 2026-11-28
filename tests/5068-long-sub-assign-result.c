static unsigned long total = 0x12340000UL;
static unsigned long step = 0x1123UL;

int main(void)
{
    unsigned long result = (total -= step);

    if (total != 0x1233EEDDUL)
        return 1;
    return result != 0x1233EEDDUL ? 2 : 0;
}
