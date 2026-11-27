struct S {
    unsigned char a, b, c;
};

static struct S src = {1, 2, 3};

int main(void)
{
    struct S dst;

    dst = src;
    return dst.a != 1 || dst.b != 2 || dst.c != 3;
}
