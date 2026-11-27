#include <stdbool.h>

static bool initial = 0x10000UL;

static bool convert(unsigned long value)
{
    return value;
}

static int take_bool(bool value)
{
    return value;
}

static int check(unsigned long value)
{
    bool flag = 2;

    if (flag != true || initial != true)
        return 1;
    flag = value;
    if (flag != true || convert(value) != true)
        return 2;
    if (take_bool(value) != true || (bool)value != true)
        return 3;
    flag = false;
    flag += value;
    if (flag++ != true || flag != true)
        return 4;
    return convert(0) != false;
}

int main(void)
{
    return check(0x10000UL);
}
