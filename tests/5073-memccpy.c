#include <string.h>

static unsigned char src[257];
static unsigned char dst[258];

int main(void)
{
    memset(dst, '!', sizeof(dst));
    if (memccpy(dst, "abc", 'a', 0) != NULL || dst[0] != '!')
        return 1;
    if (memccpy(dst, "abc", 'b', 3) != dst + 2 ||
        dst[0] != 'a' || dst[1] != 'b' || dst[2] != '!')
        return 2;
    if (memccpy(dst, "xyz", 'z', 2) != NULL ||
        dst[0] != 'x' || dst[1] != 'y' || dst[2] != '!')
        return 3;

    memset(src, 'x', sizeof(src));
    src[255] = 0x80;
    if (memccpy(dst, src, 0x180, sizeof(src)) != dst + 256 ||
        dst[254] != 'x' || dst[255] != 0x80 || dst[256] != '!')
        return 4;
    return 0;
}
