static int less_equal(long left, long right)
{
    return left <= right;
}

int main(void)
{
    int failed = 0;
    if (!less_equal(1L, 0x01000000L))
        failed |= 1;
    if (less_equal(0x01000000L, 1L))
        failed |= 2;
    if (!less_equal(1L, 1L))
        failed |= 4;
    return failed;
}
