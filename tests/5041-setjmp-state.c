#pragma register-vars (on)

#include <setjmp.h>

static jmp_buf env;

static void jump(int n, ...)
{
    register int r = n;

    if (r == 5)
        longjmp(env, -2);
}

static int check(int n, ...)
{
    register int r = n + 1;
    register volatile int v = 0;

    switch (setjmp(env)) {
    case 0:
        v = 3;
        jump(5, 2);
        return 1;
    case -2:
        return n != 7 || r != 8 || v != 3;
    default:
        return 2;
    }
}

int main(void)
{
    return check(7, 9);
}
