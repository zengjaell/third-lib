# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    22/04 2021 13:39
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        22/04 2021      create the file
# 
#     last modified: 22/04 2021 13:39
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := pcre2
TARGET_VERSION 			:= 10.36
TARGET_DOWNLOAD_PATH 	:= https://udomain.dl.sourceforge.net/project/pcre/$(PROJECT_TARGET)/$(TARGET_VERSION)

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
			--prefix=$(PREFIX_PATH) \
			--build=$(BUILD) \
			--host=$(HOST) \
			--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

