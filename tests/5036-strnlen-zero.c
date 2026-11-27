#include <string.h>

int main(void)
{
    return strnlen("abc", 0) != 0;
}
