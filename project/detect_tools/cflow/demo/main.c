/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    06/08 2021 15:56
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        06/08 2021      create the file
 * 
 *     last modified: 06/08 2021 15:56
 */
#include <stdio.h>

void a(void)
{
    printf("a \n");
}

void b(void)
{
    a();
    printf("b \n");
}

void c(void)
{
    a();
    b();
    printf("c \n");
}

void d(void)
{
    a();
    b();
    c();
    printf("d \n");
}

int main(int argc, char *argv[])
{
    a();
    b();
    c();
    d();

    return 0;
}

