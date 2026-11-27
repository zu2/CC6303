int main(void)
{
    unsigned char c = 1;
    long x = 0x10000L;
    unsigned int int_size = sizeof(int);
    int failed = 0;

    if (sizeof(c && 1) != int_size)
        failed |= 1;
    if (sizeof(x || 0) != int_size)
        failed |= 2;
    if ((x && 1) != 1)
        failed |= 4;
    if ((x || 0) != 1)
        failed |= 8;

#if (1UL && 1) <= -1
    failed |= 16;
#endif
#if (0UL || 1) <= -1
    failed |= 32;
#endif

    return failed;
}
