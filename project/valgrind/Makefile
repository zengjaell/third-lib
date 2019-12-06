# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:40
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET         	:= valgrind
TARGET_VERSION 			:= 3.14.0
TARGET_DOWNLOAD_PATH 	:= http://www.valgrind.org/downloads
TAR_CMD 				:= tar -xjvf
TAR_SUFFIX 				:= tar.bz2

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk


all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && ./autogen.sh
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=armv7-linux

# 注意：只支持 armV7、armV8两种arm CPU架构。
# 
# 注意：特别注意安装目录，否则出现如下错误：
# “valgrind: failed to start tool 'memcheck' for platform 'arm-linux': No such file or directory”
# 增加目录路径：
# 	export VALGRIND_LIB=/lib/valgrind

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean debug

