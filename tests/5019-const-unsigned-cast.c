int main(void)
{
    int failed = 0;
    if ((unsigned int)(signed char)-1 != 0xFFFFU)
        failed |= 1;
    if ((unsigned long)-1 != 0xFFFFFFFFUL)
        failed |= 2;
    return failed;
}
