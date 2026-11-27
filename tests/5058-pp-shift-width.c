#if (1U << 16) != 65536UL
#error wrong left shift in #if
#endif

#if ((1U << 15) >> 16) != 0
#error wrong right shift in #if
#endif

int main(void)
{
    return 0;
}
