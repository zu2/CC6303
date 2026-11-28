#include <stdlib.h>

int main(void)
{
    if (abs(0) != 0 || abs(123) != 123 || abs(-256) != 256 ||
        abs(-32767) != 32767)
        return 1;
    if (atoi("123xyz") != 123 || atoi("+32767") != 32767)
        return 2;
    if (atoi(" \t\r\n\f\v-32768x") != -32767 - 1)
        return 3;
    if (atoi("") != 0 || atoi(" -") != 0 || atoi("x1") != 0)
        return 4;
    return 0;
}
