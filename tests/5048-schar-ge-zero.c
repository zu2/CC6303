int main(void)
{
    signed char x = -1;
    int ge = x >= 0;
    int gt = x > -1;
    int failed = 0;

    if (ge != 0)
        failed |= 1;
    if (gt != 0)
        failed |= 2;
    return failed;
}
