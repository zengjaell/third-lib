
#define _GNU_SOURCE 1

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int mem_leak() {
    const int array_size = 32; 
    void* p = malloc(array_size);
    return 0;
}

int main(int argc, char *argv[])
{
    mem_leak();

    return 0;
}

