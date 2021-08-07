/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.cpp
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    07/08 2021 08:44
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        07/08 2021      create the file
 * 
 *     last modified: 07/08 2021 08:44
 */
#include <iostream>
#include <pthread.h>

void *FastFunc(void *_arg)
{
    double sum = 0;

    for(int i = 0; i < 100000000; i++) {
        sum += 1;
    }

    return NULL;
}

void *SlowFunc(void *_arg)
{
    double sum = 0;

    for(int i = 0; i < 100000000; i++) {
        sum *= 3;
        sum /= 3;
        sum += 1;
    }

    return NULL;
}

void *AllFunc(void *_arg)
{
    FastFunc(NULL);
    SlowFunc(NULL);

    return (NULL);
}

int main(int argc, char *argv[])
{
    pthread_t tidFast = 0, tidSlow = 0, tidAll = 0;
    pthread_create(&tidFast, NULL, FastFunc, NULL);
    pthread_create(&tidSlow, NULL, SlowFunc, NULL);
    pthread_create(&tidAll, NULL, AllFunc, NULL);

    pthread_join(tidFast, NULL);
    pthread_join(tidSlow, NULL);
    pthread_join(tidAll, NULL);

    return (0);
}
