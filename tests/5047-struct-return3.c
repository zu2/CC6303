struct S {
    unsigned char a;
    unsigned int b;
};

static struct {
    struct S s;
    unsigned char guard;
} src = {{0x81, 0x2443U}, 0x5A},
  dst = {{0, 0}, 0xA5};

static struct S make(void)
{
    return src.s;
}

static int check(struct S s)
{
    return s.a != 0x81 || s.b != 0x2443U;
}

int main(void)
{
    dst.s = make();
    if (check(dst.s) || dst.guard != 0xA5)
        return 1;
    if (make().b != 0x2443U)
        return 2;
    if (check(make()))
        return 3;
    return 0;
}
