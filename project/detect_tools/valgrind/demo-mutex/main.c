
#define _GNU_SOURCE 1

#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

static void delay_ms(const int ms) {
    struct timespec ts;
    assert(ms >= 0);
    ts.tv_sec = ms / 1000;
    ts.tv_nsec = (ms % 1000) * 1000 * 1000;
    nanosleep(&ts, 0);
}

void double_lock_mutex(const int ms) {
    pthread_mutex_t     mutex;
    pthread_mutexattr_t mutexattr;

    fprintf(stderr, "Locking mutex ...\n");

    pthread_mutexattr_init(&mutexattr);
    pthread_mutexattr_settype(&mutexattr, PTHREAD_MUTEX_RECURSIVE);
    pthread_mutex_init(&mutex, &mutexattr);
    pthread_mutexattr_destroy(&mutexattr);
    pthread_mutex_lock(&mutex);
    delay_ms(ms);
    pthread_mutex_lock(&mutex);
    pthread_mutex_unlock(&mutex);
    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
}

int main(int argc, char** argv) {
    int interval = 0;
    int optchar;

    while ((optchar = getopt(argc, argv, "i:")) != EOF) {
        switch (optchar) {
            case 'i':
                interval = atoi(optarg);
                break;
            default:
                fprintf(stderr, "Usage: %s [-i <interval time in ms>].\n", argv[0]);
                break;
        }
    }

    double_lock_mutex(interval);

    fprintf(stderr, "Done.\n");

    return 0;
}

