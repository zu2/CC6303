#include <string.h>

static char dst[4] = "a";

int main(void)
{
    strcat(dst, "b");
    if (dst[0] != 'a' || dst[1] != 'b' || dst[2] != 0)
        return 1;
    if (strcat(dst, "") != dst)
        return 2;
    return 0;
}
