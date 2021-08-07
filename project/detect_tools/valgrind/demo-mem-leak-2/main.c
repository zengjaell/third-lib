
#define _GNU_SOURCE 1

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int mem_leak() {
    const int array_size = 32; 
    void* p = malloc(array_size);
    free(p);
    return 0;
}

void* create(unsigned int size) {
    return malloc(size);
}
 
void create_destory(unsigned int size) {
    void *p = create(size);
    free(p);
}
 
int main(void) {
    const int loop = 4;
    char* a[loop];
    unsigned int kilo = 1024;
 
    for (int i = 0; i < loop; i++) {
        const unsigned int create_size = 10 * kilo;
        create(create_size);
 
        const unsigned int malloc_size = 10 * kilo;
        a[i] = malloc(malloc_size);
 
        const unsigned int create_destory_size = 100 * kilo;
        create_destory(create_destory_size);
    }
 
    for (int i = 0; i < loop; i++) {
        free(a[i]);
    }
 
    return 0;
}

