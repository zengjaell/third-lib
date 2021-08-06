/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    06/08 2021 20:47
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        06/08 2021      create the file
 * 
 *     last modified: 06/08 2021 20:47
 */
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

