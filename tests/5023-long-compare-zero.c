static long value = 0x00800000L;

int main(void)
{
    int failed = 0;
    if ((value < 0L) != 0)
        failed |= 1;
    if ((value >= 0L) != 1)
        failed |= 2;
    return failed;
}
