#include <string.h>

int main(void)
{
    if (strcmp("b", "a") <= 0 || strcmp("a", "b") >= 0)
        return 1;
    if (strcmp("a\0b", "a\0c") != 0 || strcmp("a", "ab") >= 0)
        return 2;
    if (strcmp("\200", "\177") <= 0)
        return 3;
    return 0;
}
