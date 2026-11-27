static unsigned int u16 = 65535U;
static unsigned long u32 = 0xFFFFFFFFUL;

int main(void)
{
    int failed = 0;

    if ((u16 <= -2) != 0)
        failed |= 1;
    if ((u16 > -2) != 1)
        failed |= 2;
    if ((u32 <= -2) != 0)
        failed |= 4;
    if ((u32 > -2) != 1)
        failed |= 8;
    return failed;
}
