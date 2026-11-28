static unsigned char samples[257];
static signed char offset = -1;

int main(void)
{
    unsigned char local[] = {0x56, 0};
    signed char i = -1;

    samples[0] = 0x12;
    samples[256] = 0x34;
    if ((samples + 1)[offset] != 0x12 || (samples + 1)[i] != 0x12)
        return 1;
    return (&local[1])[i] != 0x56;
}
