# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    04/08 2021 15:56
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        04/08 2021      create the file
# 
#     last modified: 04/08 2021 15:56
# ===============================================================

lib_3rd_path := /opt/data/install/pc/x86_64-linux-gnu

all: clean protoc-c main

main:
	gcc main.c addressbook.pb-c.c -I. -I $(lib_3rd_path)/include -L $(lib_3rd_path)/lib -lprotobuf-c -o main

protoc-c:
	protoc-c --c_out=. addressbook.proto

clean:
	rm -rf main addressbook.pb-c.c addressbook.pb-c.h
