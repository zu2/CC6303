#include <setjmp.h>

static jmp_buf env;

static void jump(int value)
{
    longjmp(env, value);
}

int main(void)
{
    switch (setjmp(env)) {
    case 0: jump(0x1234); return 1;
    case 0x1234: jump(0x34); return 2;
    case 0x34: jump(0); return 3;
    case 1: return 0;
    default: return 4;
    }
}
