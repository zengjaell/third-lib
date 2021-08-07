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
 

unsigned long g_a = 0;
unsigned long g_b = 0;
 
void* thread_routine(void* arg) {
    while(1) {
        (*((unsigned long*)arg))++;
    }
};
 
void test_cpu_ability() {
    pthread_t thread_a;
    pthread_create(&thread_a, NULL, thread_routine, &g_a);
    pthread_detach(thread_a);
 
    pthread_t thread_b;
    pthread_create(&thread_b, NULL, thread_routine, &g_b);
    pthread_detach(thread_b);
 
    sleep(3);
    printf("a:%lu\tb:%lu\n", g_a, g_b);
};

int main(int argc, char *argv[])
{
    test_cpu_ability();

    return 0;
}
