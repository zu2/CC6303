#if 0
#if 1 / 0 /*
#endif
*/
#error wrong nested branch
#endif
#else
#define OUTER_OK 1
#endif

#if 1
#define FIRST_OK 2
#elif 1 / 0
#error wrong elif branch
#endif

#if 0
#elif 6 / 2 == 3
#define ELIF_OK 4
#endif

int main(void)
{
    int result = OUTER_OK + FIRST_OK + ELIF_OK;

    return result != 7;
}
