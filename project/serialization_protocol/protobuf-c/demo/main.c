/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    04/08 2021 14:23
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        04/08 2021      create the file
 * 
 *     last modified: 04/08 2021 14:23
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "addressbook.pb-c.h"

static int32_t _do_pack(uint8_t *buf)
{
    Tutorial__Person__PhoneNumber *phone_number = malloc(sizeof(*phone_number));
    if (!phone_number) {
        printf("malloc faild \n");
        return -1;
    }
    tutorial__person__phone_number__init(phone_number);

    phone_number->type = TUTORIAL__PERSON__PHONE_TYPE__HOME;
    phone_number->number = "110";

    Tutorial__Person *person = malloc(sizeof(*person));
    if (!person) {
        printf("malloc faild \n");
        return -1;
    }
    tutorial__person__init(person);

    person->id = 1;
    person->name = "haha";
    person->email = "haha@110.com";
    person->n_phones = 1;
    person->phones = &phone_number;

    Tutorial__Addressbook address_book = TUTORIAL__ADDRESSBOOK__INIT;

    address_book.n_people = 1;
    address_book.people = &person;

    int32_t len = tutorial__addressbook__pack(&address_book, buf);

    if (phone_number) {
        free(phone_number);
        phone_number = NULL;
    }

    if (person) {
        free(person);
        person = NULL;
    }

    return len;
}

static int32_t _do_unpack(const uint8_t *buf, size_t len)
{
    Tutorial__Addressbook *address_book = tutorial__addressbook__unpack(NULL, len, buf);
    if (!address_book) {
        printf("user__unpack failed\n");
        return -1;
    }

    for (int i = 0; i < address_book->n_people; ++i) {
        Tutorial__Person *people = address_book->people[i];

        printf("id: %d, name: %s, email: %s \n",
                people->id, people->name, people->email);
    }

    tutorial__addressbook__free_unpacked(address_book, NULL);

    return 0;
}

int main(int argc, char *argv[])
{
    uint8_t buf[1024] = {0};
    int32_t len = 0;

    len = _do_pack(buf);
    printf("len: %d \n", len);

    _do_unpack(buf, len);

    return 0;
}

