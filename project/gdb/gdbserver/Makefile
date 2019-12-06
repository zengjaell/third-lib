# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:10
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:10
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

PROJECT_TARGET  		:= gdb
TARGET_VERSION 			:= 8.2.1
TARGET_DOWNLOAD_PATH 	:= http://ftp.gnu.org/gnu/gdb
PROJECT_TARGET_SERVER 	:= gdbserver
GDB_SERVER_PATH 		:= $(PROJECT_TARGET)/$(PROJECT_TARGET_SERVER)

PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

TARGET_PATH 			:= $(PROJECT_DIR)/$(GDB_SERVER_PATH)

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/gdb/gdbserver/configure \
		CC=$(GCC) CXX=$(CXX) AR=$(AR) LD=$(LD) \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

