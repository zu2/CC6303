#include <ctype.h>

int main(void)
{
    if (!isalpha('A') || !isalpha('a') || isalpha('0') || isalpha(128))
        return 1;
    if (!isalnum('0') || !isalnum('A') || !isalnum('a') || isalnum(128))
        return 2;
    if (!isascii(0) || !isascii(127) || isascii(128) || isascii(256) || isascii(-1))
        return 3;
    if (!iscntrl(31) || !iscntrl(127) || iscntrl(32) || iscntrl(128))
        return 4;
    if (!ispunct('!') || !ispunct('~') || ispunct('1') || ispunct(128))
        return 5;
    if (!isspace('\t') || !isspace('\r') || !isspace(' ') || isspace(128))
        return 6;
    if (!isxdigit('0') || !isxdigit('A') || !isxdigit('a') || isxdigit(128))
        return 7;
    if (toupper(-1) != -1 || tolower(-1) != -1 ||
        toupper('a') != 'A' || tolower('Z') != 'z')
        return 8;
    return 0;
}
