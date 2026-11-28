unsigned char count = 254;
unsigned int total;

int main(void)
{
    total = 0x1200U;
    total += ++count;
    if (total != 0x12FFU || count != 255)
        return 1;

    total = 0x1200U;
    total += (count += 1);
    return total != 0x1200U || count != 0 ? 2 : 0;
}
