# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/12 2019 13:49
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/12 2019      create the file
# 
#     last modified: 25/12 2019 13:49
# ===============================================================
ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

CFLAGS 	+= -I$(PREFIX_PATH)/include \
		   -I.  -std=gnu99
LDFLAGS += -L$(PREFIX_PATH)/lib -lpcap \
		   -L.

all:
	$(GCC) *.c $(CFLAGS) $(LDFLAGS) -o main

list:

.PHONY: all clean distclean list

