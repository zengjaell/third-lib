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

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

include $(top_dir)/configs/common_var.mk

_target     := main
_src_com    := main.c

all: $(_target)-clean $(_target)-main

include $(sub_target_path)/common_sub_target.mk

cppflags_com += -I$(include_path)/libevdev-1.0
libs_com += -levdev

$(_target)-clean:
	$(RM) $(@:-clean=)

$(_target)-main:
	$(GCC) $(_src_com) -o $(@:-main=) $(cflags_com) $(cppflags_com) $(ldflags_com) $(libs_com)


.PHONY: all clean clean_inside distclean list

