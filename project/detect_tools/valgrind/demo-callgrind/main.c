#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

static int exit_flag = 0;

static void hello()
{
    printf(".");
}

static void *_test_loop(void *args)
{
    for (int i = 0; i < 3000; ++i) {
        hello();
    }
    printf("\n");

    exit_flag++;
    return NULL;
}

int main(int argc, char *argv[])
{
    pthread_t id, id1;

    pthread_create(&id, NULL, _test_loop, NULL);
    pthread_create(&id1, NULL, _test_loop, NULL);

    while (exit_flag != 2) {
        sleep(1);
    }

    pthread_join(id, NULL);
    pthread_join(id1, NULL);

    return 0;
}

