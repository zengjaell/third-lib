
#define _GNU_SOURCE 1

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int doubule_free() {
    const int array_count = 4;
    int* p = malloc(array_count * sizeof(int));
    free(p);
    free(p);
    return 0;
}

int no_heap() {
    int n = 1;
    int* p = &n;
    free(p);
    return 0;
}

int overflow() {
    char p[8] = {0};
    // 内存覆盖
    memcpy(p + 1, p, sizeof(char) * 8);
    return 0;
}

int test() {
    const int array_size = -1;
    void* p = malloc(array_size);
    free(p);
    return 0;
}

int main(int argc, char *argv[])
{
    doubule_free();
    no_heap();
    overflow();
    test();

    return 0;
}

