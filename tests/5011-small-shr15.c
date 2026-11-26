#pragma codesize (10)

static unsigned int shift(unsigned int value)
{
    return (value ^ 1U) >> 15;
}

int main(void)
{
    return shift(0x8000U) != 1U;
}
