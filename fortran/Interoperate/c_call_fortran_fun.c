#include <stdio.h>
extern int add_v(int, int);
extern int add_p(int*, int*);
int main()
{
    int a = 3, b = 4;

    printf("add_v value is %d\n",add_v(a,b));
    printf("add_p value is %d\n",add_p(&a,&b));
    return 0;
}
