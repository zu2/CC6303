static volatile unsigned int word = 0x0100U;
static volatile unsigned long left = 1UL;
static volatile unsigned long right = 0x7FFFUL;

int main(void)
{
    int failed = 0;
    if ((word != 0U) != 1)
        failed |= 1;
    if ((left < right) != 1)
        failed |= 2;
    return failed;
}
