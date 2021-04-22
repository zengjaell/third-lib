# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    20/04 2021 16:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        20/04 2021      create the file
# 
#     last modified: 20/04 2021 16:23
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := freetype
TARGET_VERSION 			:= 2.10.4
TARGET_DOWNLOAD_PATH 	:= https://iweb.dl.sourceforge.net/project/freetype/freetype2/$(TARGET_VERSION)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: depend_lib $(TARGET_DIR)-make

ZLIB_FILE 	:= $(PREFIX_PATH)/include/zlib.h
PNG_FILE 	:= $(PREFIX_PATH)/include/png.h
depend_lib:
ifneq ($(ZLIB_FILE), $(wildcard $(ZLIB_FILE)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(PNG_FILE), $(wildcard $(PNG_FILE)))
	$(ECHO) "\tuse \"make project=libpng \" first to compile libpng."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)

	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
			CC=$(GCC) \
			--with-zlib=yes \
			--with-png=yes \
			--with-harfbuzz=no \
			PKG_CONFIG_PATH=$(PREFIX_PATH)/lib/pkgconfig \
			--prefix=$(PREFIX_PATH) \
			--build=$(BUILD) \
			--host=$(HOST) \
			--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

