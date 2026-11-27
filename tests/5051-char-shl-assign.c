int main(void)
{
    unsigned char x = 0x80;
    int count = 1;
    int failed = 0;

    if (((x <<= 1) >> 8) != 0 || x != 0)
        failed |= 1;

    x = 0x80;
    if (((x <<= count) >> 8) != 0 || x != 0)
        failed |= 2;

    return failed;
}
