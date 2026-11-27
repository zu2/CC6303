int main(void)
{
    unsigned char c = 0;
    long x = 0x10000L;
    unsigned int int_size = sizeof(int);
    int failed = 0;

    if (sizeof(!c) != int_size)
        failed |= 1;
    if (sizeof(!x) != int_size)
        failed |= 2;
    if (sizeof(!0L) != int_size)
        failed |= 4;
    if ((!c) != 1 || (!x) != 0)
        failed |= 8;

    return failed;
}
