int main(void)
{
    int failed = 0;
    if ((-2 / 2U) != 0x7FFFU)
        failed |= 1;
    if ((-1L % 7UL) != 3UL)
        failed |= 2;
    return failed;
}
