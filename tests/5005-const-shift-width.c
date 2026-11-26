int main(void)
{
    int failed = 0;
    if (((0x8000U << 1) >> 1) != 0U)
        failed |= 1;
    if (((0x80000000UL << 1) >> 1) != 0UL)
        failed |= 2;
    return failed;
}
