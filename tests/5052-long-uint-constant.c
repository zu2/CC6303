int main(void)
{
    long x = -4L;
    int failed = 0;

    if (!(x < 1U))
        failed |= 1;
    if (x / 2U != -2L)
        failed |= 2;
    if (x % 3U != -1L)
        failed |= 4;

    return failed;
}
