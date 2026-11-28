static int total = -1234;
static unsigned int count = 0xFEDCU;
static char buffer[2];
static char *p = buffer + 1;

int main(void)
{
    if ((total += 0) != -1234 || total != -1234)
        return 1;
    if ((count += 0) != 0xFEDCU || count != 0xFEDCU)
        return 2;
    return (p += 0) != buffer + 1 || p != buffer + 1;
}
