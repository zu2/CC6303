struct S {
    unsigned char a;
    unsigned int b;
};

struct Outer {
    unsigned char lead;
    struct S s;
};

static struct Outer src = {0xA5, {0x81, 0x2443U}};
static struct Outer *p = &src;

static int check(unsigned int before, struct S s, unsigned int after)
{
    const unsigned char *bytes = (const unsigned char *)&s;

    return before != 0x1234U || after != 0x5678U ||
        bytes[0] != 0x81 || bytes[1] != 0x24 || bytes[2] != 0x43;
}

int main(void)
{
    struct S dst;

    if (check(0x1234U, p->s, 0x5678U))
        return 1;
    if (check(0x1234U, dst = src.s, 0x5678U))
        return 2;
    return 0;
}
