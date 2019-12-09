# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    09/12 2019 10:45
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        09/12 2019      create the file
# 
#     last modified: 09/12 2019 10:45
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

PROJECT_TARGET_TOP 		:= ffmpeg
PROJECT_TARGET  		:= fdk-aac
TARGET_VERSION 			:= 2.0.1
TARGET_DOWNLOAD_PATH 	:= https://downloads.sourceforge.net/opencore-amr

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP)/$(PROJECT_TARGET)
PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CFLAGS="-pipe" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--target=$(HOST) \
		--disable-static

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

