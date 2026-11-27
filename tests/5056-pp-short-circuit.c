#if 0 && (1 && (1 / 0))
#error && must give 0
#endif

#if !(1 || (0 || (1 % 0)))
#error || must give 1
#endif

#if (0 && (1 / 0)) || (6 / 2 != 3)
#error the next operand must be evaluated
#endif

int main(void)
{
    return 0;
}
