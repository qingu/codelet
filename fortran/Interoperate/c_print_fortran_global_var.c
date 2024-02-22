#include <stdio.h>

extern double PI;

int main(int *argc, char **argv)
{
    printf("PI from fortran is %f\n",PI);
    return 0;
}
