struct S {
    unsigned char a, b, c, d, e;
};

static struct S src = {0x81, 0x24, 0x43, 0x65, 0xA5};

int main(void)
{
    struct S dst, copy;

    if ((copy = dst = src).e != 0xA5)
        return 1;
    return dst.a != 0x81 || copy.a != 0x81;
}
