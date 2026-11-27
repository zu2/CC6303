#if (-4L / 2U) < 0
#error signed division in #if
#endif

#if (-4L % 3U) < 0
#error signed remainder in #if
#endif

int main(void)
{
    long quotient = -4L / 2U;
    long remainder = -4L % 3U;

    return quotient != -2L || remainder != -1L;
}
