#include <string.h>

static unsigned char buf[] = {0x12, 0x34, 0x56, 0x78};

int main(void)
{
    if (memset(buf + 1, 0x1A6, 2) != buf + 1)
        return 1;
    if (buf[0] != 0x12 || buf[1] != 0xA6 ||
        buf[2] != 0xA6 || buf[3] != 0x78)
        return 2;
    if (memset(buf + 1, 0, 0) != buf + 1 || buf[1] != 0xA6)
        return 3;
    return 0;
}
