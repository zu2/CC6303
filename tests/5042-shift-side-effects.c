static unsigned int calls;

static void tick(void)
{
    ++calls;
}

int main(void)
{
    unsigned int a = 3;

    if ((a << (tick(), 1)) != 6 || calls != 1)
        return 1;
    if ((8U >> (tick(), 0)) != 8 || calls != 2)
        return 2;
    return 0;
}
