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
_src_com    := *.c

all: $(_target)-clean $(_target)-main

include $(sub_target_path)/common_sub_target.mk

cppflags_com += -I.
libs_com +=

$(_target)-clean:
	$(RM) $(@:-clean=).gif

$(_target)-main:
	cflow -m= $(_src_com) | $(tools_path)/tree2dotx | dot -Tgif -o $(@:-main=).gif

.PHONY: all clean clean_inside distclean list

