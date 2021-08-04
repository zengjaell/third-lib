/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.cpp
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    04/08 2021 16:02
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        04/08 2021      create the file
 * 
 *     last modified: 04/08 2021 16:02
 */
#include <iostream>
#include <fstream>
#include <string>

#include "addressbook.pb.h"

using namespace std;
using namespace tutorial;

void PromptForAddress(Person* person) {
    cout << "Enter person ID number: ";
    int id;
    cin >> id;
    person->set_id(id);
    cin.ignore(256, '\n');

    cout << "Enter name: ";
    getline(cin, *person->mutable_name());

    cout << "Enter email address (blank for none): ";
    string email;
    getline(cin, email);
    if (!email.empty())
        person->set_email(email);

    while (true) {
        cout << "Enter a phone number (or leave blank for finish): ";
        string number;
        getline(cin, number);
        if (number.empty())
            break;

        Person::PhoneNumber* phone_number = person->add_phones();
        phone_number->set_number(number);

        cout << "Is this a mobile, home, or work phone? ";
        string type;
        getline(cin, type);
        if (type == "mobile")
            phone_number->set_type(Person::MOBILE);
        else if (type == "home")
            phone_number->set_type(Person::HOME);
        else if (type == "work")
            phone_number->set_type(Person::WORK);
        else
            cout << "Unkown phone type. Using default. " << endl;
    }
}

static int32_t _write(int argc, char* argv[])
{
    Addressbook address_book;

    fstream input(argv[1], ios::in | ios::binary);
    if (!input)
        cout << argv[1] << ": File not found. Creating a new file. " << endl;
    else if (!address_book.ParseFromIstream(&input)) {
        cerr << "Failed to parse address book. " << endl;
        return -1;
    }

    PromptForAddress(address_book.add_people());

    fstream output(argv[1], ios::out | ios::trunc | ios::binary);
    if (!address_book.SerializeToOstream(&output)) {
        cerr << "Failed to write address book. " << endl;
        return -1;
    }

    return 0;
}

void ListPeople(const Addressbook& address_book) {
    for (int i = 0; i < address_book.people_size(); ++i) {
        const Person& person = address_book.people(i);

        cout << "Person ID: " << person.id() << endl;
        cout << "Name: " << person.name() << endl;
        if (person.has_email()) {
            cout << " E-mail address: " << person.email() << endl;
        }

        for (int j = 0; j < person.phones_size(); ++j) {
            const Person::PhoneNumber& phone_number = person.phones(j);
            switch (phone_number.type()) {
                case Person::MOBILE:
                    cout << " Mobile phone#: ";
                    break;
                case Person::HOME:
                    cout << " Home phone#: ";
                    break;
                case Person::WORK:
                    cout << " Work phone#: ";
                    break;
            }
            cout << phone_number.number() << endl;
        }
    }
}

static int _read(int argc, char** argv) {
    GOOGLE_PROTOBUF_VERIFY_VERSION;
    if (argc != 2) {
        cerr << "Usage: " << argv[0] << "ADDRESS_BOOK_FILE " << endl;
        return -1;
    }

    Addressbook address_book;
    fstream input(argv[1], ios::in | ios::binary);
    if (!address_book.ParseFromIstream(&input)) {
        cerr << "Failed to parse address book. " << endl;
        return -1;
    }

    ListPeople(address_book);

    google::protobuf::ShutdownProtobufLibrary();
    return 0;
}

int main(int argc, char* argv[])
{
    if (argc != 2) {
        cerr << "Usage: " << argv[0] << " address_book" << endl;
        return -1;
    }

    _write(argc, argv);

    _read(argc, argv);

    return 0;
}

