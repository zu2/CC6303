enum {
    and_value = 1 && 2,
    or_value = 0 || 0 || 2,
    nested_value = 1 && (0 || 1) && 0
};

int main(void)
{
    int a = and_value;
    int b = or_value;
    int c = nested_value;

    return a != 1 || b != 1 || c != 0;
}
