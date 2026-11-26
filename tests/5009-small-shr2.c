#pragma codesize (10)

static unsigned int shift(unsigned int value)
{
    return value >> 2;
}

int main(void)
{
    return shift(4U) != 1U;
}
