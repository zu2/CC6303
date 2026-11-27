#include <string.h>

static char dst[4] = "abc";

int main(void)
{
    if (strncpy(dst, "xyz", 2) != dst || dst[0] != 'x' ||
        dst[1] != 'y' || dst[2] != 'c')
        return 1;
    if (strncpy(dst, "", 0) != dst || dst[0] != 'x')
        return 2;
    return 0;
}
