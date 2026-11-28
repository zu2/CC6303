unsigned char frame = 254;
signed char offset = -12;

int main(void)
{
    int u = (frame += 5);
    int s = (offset += 5);

    return u != 3 || frame != 3 || s != -7 || offset != -7;
}
