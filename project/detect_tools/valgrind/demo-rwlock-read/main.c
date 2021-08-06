
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

void read_lock(const int ms) {
  pthread_rwlock_t    rwlock;
 
  fprintf(stderr, "Locking rwlock shared ...\n");
 
  pthread_rwlock_init(&rwlock, 0);
  pthread_rwlock_rdlock(&rwlock);
  delay_ms(ms);
  pthread_rwlock_rdlock(&rwlock);
  pthread_rwlock_unlock(&rwlock);
  pthread_rwlock_unlock(&rwlock);
  pthread_rwlock_destroy(&rwlock);
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

    read_lock(interval);

    fprintf(stderr, "Done.\n");

    return 0;
}

