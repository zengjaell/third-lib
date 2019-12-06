# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:23
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET         	:= ncurses
TARGET_VERSION 			:= 6.1
TARGET_DOWNLOAD_PATH 	:= http://ftp.gnu.org/gnu/ncurses

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CPPFLAGS="-pipe" \
		--prefix=$(PREFIX_PATH) \
		--program-prefix=$(PROGRAM_PREFIX) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--without-cxx \
		--without-cxx-binding \
		--without-ada \
		--without-manpages \
		--without-progs \
		--without-tests \
		--with-shared

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

