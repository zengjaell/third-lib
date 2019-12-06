# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:19
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:19
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := curl
TARGET_VERSION 			:= 7.64.1
TARGET_DOWNLOAD_PATH 	:= https://curl.haxx.se/download

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

ZLIB_DIR           		:= $(PREFIX_PATH)/include/zlib.h
OPENSSL_DIR        		:= $(PREFIX_PATH)/include/openssl

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(ZLIB_DIR), $(wildcard $(ZLIB_DIR)))
	$(ECHO) "\tuse \"make project=zlib\" first to  compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(OPENSSL_DIR), $(wildcard $(OPENSSL_DIR)))
	$(ECHO) "\tuse \"make project=openssl\" first to compile openssl."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CPPFLAGS="-pipe" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--host=$(HOST) \
		--build=$(BUILD) \
		--with-zlib=$(PREFIX_PATH) \
		--with-ssl=$(PREFIX_PATH)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

