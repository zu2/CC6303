struct Word {
    unsigned char pad[255];
    unsigned int value;
};

struct Long {
    unsigned char pad[253];
    unsigned long value;
};

static struct Word word;
static struct Long wide;

static void put_word(struct Word *p)
{
    p->value = 0x1234U;
}

static void put_long(struct Long *p)
{
    p->value = 0x12345678UL;
}

int main(void)
{
    put_word(&word);
    if (word.value != 0x1234U)
        return 1;
    put_long(&wide);
    return wide.value != 0x12345678UL;
}
