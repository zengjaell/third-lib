# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:07
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:07
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

PROJECT_TARGET  		:= gdb
TARGET_VERSION 			:= 8.2.1
TARGET_DOWNLOAD_PATH 	:= http://ftp.gnu.org/gnu/gdb

PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET)/$(PROJECT_TARGET)

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

# --enable-shared    			动态编译
# --without-x     				取消x windows 支持
# --disable-gdbtk  				取消gdbtk,应该也是图形界面相关的
# --disable-tui   				取消tui 界面
# --without-included-regex 		关闭正则表达式库
# --without-included-gettext  	去掉用于多语言处理的 gettext库
# CPPFLAGS/LDFLAGS				确保能找到ARM版的ncurses库

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) AR=$(AR) LD=$(LD) \
		LDFLAGS="-L$(PREFIX_PATH)/lib" \
		CFLAGS="-I$(PREFIX_PATH)/include -pipe" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--target=$(HOST)

	cp ./remote.c $(TARGET_PATH)/$(@:-config=)/gdb/remote.c

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

