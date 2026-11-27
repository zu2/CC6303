#include <stdarg.h>

struct S {
    unsigned char a;
};

static int check(int marker, ...)
{
    va_list ap, pos;
    struct S s;
    int before, after;

    va_start(ap, marker);
    before = va_arg(ap, int);
    pos = ap;
    s = va_arg(ap, struct S);
    if (pos != ap + 1)
        return 1;
    after = va_arg(ap, int);
    va_end(ap);
    return before != 0x1234 || s.a != 0x81 || after != 0xA5;
}

int main(void)
{
    struct S s = {0x81};
    unsigned char c = 0xA5;

    return check(0, 0x1234, s, c);
}
