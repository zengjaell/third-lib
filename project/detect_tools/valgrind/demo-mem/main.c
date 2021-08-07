
#define _GNU_SOURCE 1

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int write_illegal(void)
{
    const int array_count = 4;
    int* p = malloc(array_count * sizeof(int));
    p[array_count] = 0; // Illegal write
    free(p);
    return 0;
}


int read_illegal() {
    const int array_count = 4;
    int* p = malloc(array_count * sizeof(int));
    int error_num = p[array_count]; // Illegal read
    free(p);
    return 0;
}

int uninitialised_value() {
    const int array_count = 4;
    int* p = malloc(array_count * sizeof(int));
    printf("%d",  p[array_count - 1]);
    free(p);

    int undefine_num;
    printf("%d", undefine_num);
    return 0;
}

int main(int argc, char *argv[])
{
    write_illegal();
    read_illegal();
    uninitialised_value();

    return 0;
}

