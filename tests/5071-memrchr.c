#include <string.h>

static const char buf[] = "xaba";
static unsigned char wide[258];

int main(void)
{
    if (memrchr(buf + 1, 'a', 1) != buf + 1)
        return 1;
    if (memrchr(buf + 1, 'b', 1) != NULL)
        return 2;
    if (memrchr(buf + 1, 'a', 3) != buf + 3)
        return 3;
    if (memrchr(buf + 1, 'a', 0) != NULL)
        return 4;
    if (memrchr(buf + 1, 'x', 3) != NULL)
        return 5;
    wide[0] = 0x80;
    wide[257] = 0x80;
    if (memrchr(wide, 0x180, 257) != wide)
        return 6;
    if (memrchr(wide, 0x180, 258) != wide + 257)
        return 7;
    return 0;
}
