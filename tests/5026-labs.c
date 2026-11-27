long labs(long);

int main(void)
{
    if (labs(0x12345678L) != 0x12345678L)
        return 1;
    if (labs(-0x12345678L) != 0x12345678L)
        return 2;
    return 0;
}
