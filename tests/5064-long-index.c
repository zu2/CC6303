static unsigned char samples[] = {0x12, 0x34, 0x56};
static long offset = 1;

int main(void)
{
    unsigned long i = 2;

    if (samples[offset] != 0x34)
        return 1;
    return samples[i] != 0x56;
}
