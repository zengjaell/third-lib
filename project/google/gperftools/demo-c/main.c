/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    07/08 2021 09:31
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        07/08 2021      create the file
 * 
 *     last modified: 07/08 2021 09:31
 */
#include <stdlib.h>

void f(void)
{
    for (int i = 0; i < 1024 * 1024; i++) {
        char *p = (char*)malloc(120 * 1024 * 1024);
        free(p);
    }
}

void fun1(void)
{
    f();
}

void fun2(void)
{
    f();
}

int main(int argc, const char *argv[])
{
    fun1();
    fun2();

    return 0;
}

