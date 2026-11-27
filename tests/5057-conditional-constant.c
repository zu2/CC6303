#if (1 ? 7 : 1 / 0) != 7 || (0 ? 1 % 0 : 9) != 9
#error wrong value in the selected branch
#endif

#if (1 ? -1L : 0U) < 0
#error wrong signedness
#endif

enum {
    first = 1 ? 2 : 3,
    nested = 0 ? 2 : 1 ? 4 : 5,
    unsigned_result = (1 ? -1 : 0U) >> 15
};

int main(void)
{
    int a = first;
    int b = nested;
    int c = unsigned_result;

    return a != 2 || b != 4 || c != 1;
}
