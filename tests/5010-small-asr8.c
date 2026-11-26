#pragma codesize (10)

static int shift(int value)
{
    return (value ^ 1) >> 8;
}

int main(void)
{
    return shift(257) != 1;
}
