#include <string.h>

static const char src[] = "abac";
static char dst[] = "xxx";

int main(void)
{
    if (memchr(src, 'b', 3) != src + 1)
        return 1;
    strncpy(dst, "a", sizeof dst);
    if (dst[0] != 'a' || dst[1] != 0 || dst[2] != 0 || dst[3] != 0)
        return 2;
    if (strrchr(src, 'a') != src + 2 || strrchr(src, 0) != src + 4 ||
        strrchr(src, 'z') != NULL)
        return 3;
    if (strnlen(src, 2) != 2 || strnlen(src, 5) != 4)
        return 4;
    return 0;
}
