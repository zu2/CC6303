signed char offset = -12;

int main(void)
{
    int result = (offset += 0);

    return result != -12 || offset != -12;
}
