# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/08 2021 14:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/08 2021      create the file
# 
#     last modified: 06/08 2021 14:32
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

include $(top_dir)/configs/common_var.mk

_target     := main
_src_com    := main.c

all: $(_target)-clean $(_target)-main

include $(sub_target_path)/common_sub_target.mk

cppflags_com += -I. -g -O0
libs_com += -lpthread

$(_target)-clean:
	$(RM) $(@:-clean=)

$(_target)-main:
	$(CC) $(_src_com) -o $(@:-main=) $(cflags_com) $(cppflags_com) $(ldflags_com) $(libs_com)
	valgrind --tool=drd --shared-threshold=10 ./main -i 20

.PHONY: all clean clean_inside distclean list

