int main(void)
{
    unsigned char x = 4;
    int failed = 0;

    x /= -2;
    if (x != 254)
        failed |= 1;

    x = 5;
    x %= -2;
    if (x != 1)
        failed |= 2;

    return failed;
}
