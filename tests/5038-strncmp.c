#include <string.h>

int main(void)
{
    if (strncmp("b", "a", 1) <= 0 || strncmp("a", "b", 1) >= 0)
        return 1;
    if (strncmp("a\0b", "a\0c", 3) != 0 || strncmp("a", "ab", 2) >= 0)
        return 2;
    if (strncmp("ab", "ac", 1) != 0 || strncmp("a", "b", 0) != 0)
        return 3;
    if (strncmp("\200", "\177", 1) <= 0)
        return 4;
    return 0;
}
