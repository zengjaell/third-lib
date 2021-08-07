/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    07/08 2021 10:01
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        07/08 2021      create the file
 * 
 *     last modified: 07/08 2021 10:01
 */

#define _GNU_SOURCE             /* See feature_test_macros(7) */
#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>
#include <unistd.h>
#include <sched.h>
 
void* thread_routine(void* arg) {
    int cpu = -1;
    while(1) {
        int cur_cpu = sched_getcpu();
        if (cur_cpu != cpu) {
          printf("pre:%d, cur:%d\n", cpu, cur_cpu);
         cpu = cur_cpu;
        }
    }
};
 
void test_cpu_switch() {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_routine, NULL);
    pthread_detach(thread);
    sleep(100);
}

int main(int argc, char *argv[])
{
    test_cpu_switch();

    return 0;
}
