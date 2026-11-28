#include <string.h>

static unsigned char src[768];
static unsigned char dst[sizeof(src) + 2];

static int check_copy(size_t count)
{
    size_t i;

    memset(dst, 0, sizeof(dst));
    if (memcpy(dst + 1, src, count) != dst + 1)
        return 1;
    if (dst[0] != 0 || dst[count + 1] != 0)
        return 1;
    for (i = 0; i < count; ++i)
        if (dst[i + 1] != src[i])
            return 1;
    return 0;
}

int main(void)
{
    static const size_t counts[] = {0, 1, 255, 256, 257, 511, 512, 513};
    size_t i;

    for (i = 0; i < sizeof(src); ++i)
        src[i] = (i & 127) + (i >> 8) + 1;

    for (i = 0; i < sizeof(counts) / sizeof(counts[0]); ++i)
        if (check_copy(counts[i]))
            return i + 1;
    return 0;
}
