#if 0x8000 <= -1
#error wrong type for a hex constant in #if
#endif

#if 0100000 <= -1
#error wrong type for an octal constant in #if
#endif

#if 0x8000U > -1 || 0100000UL > -1
#error wrong type for an unsigned constant in #if
#endif

int main(void)
{
    int n = -1;

    return 0x8000 > n;
}
