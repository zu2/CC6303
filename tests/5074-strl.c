#include <string.h>

static char dst[258];
static char src[258];

int main(void)
{
    dst[0] = '!';
    if (strlcpy(dst, "abcd", 0) != 4 || dst[0] != '!')
        return 1;
    if (strlcpy(dst, "abcd", 1) != 4 || dst[0] != '\0')
        return 2;
    if (strlcpy(dst, "abcd", 4) != 4 || strcmp(dst, "abc") != 0)
        return 3;
    if (strlcpy(dst, "x", 4) != 1 || strcmp(dst, "x") != 0 || dst[2] != 'c')
        return 4;

    if (strlcat(dst, "yz", 0) != 2 || strcmp(dst, "x") != 0)
        return 5;
    if (strlcat(dst, "yz", 4) != 3 || strcmp(dst, "xyz") != 0)
        return 6;
    if (strlcat(dst, "12", 2) != 4 || strcmp(dst, "xyz") != 0)
        return 7;
    if (strlcat(dst, "12", 5) != 5 || strcmp(dst, "xyz1") != 0)
        return 8;

    memset(src, 'a', 257);
    dst[257] = '!';
    if (strlcpy(dst, src, 257) != 257 ||
        dst[255] != 'a' || dst[256] != '\0' || dst[257] != '!')
        return 9;
    return 0;
}
