# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:33
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:33
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk

TARGET           		:= zlib
TARGET_PATH 			:= $(PROJECT_DIR)/$(TARGET)
TARGET_VERSION 			:= 1.2.11
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(TARGET_PATH)/$(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= https://nchc.dl.sourceforge.net/project/libpng/zlib/$(TARGET_VERSION)
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		export CC=$(CC) export CXX=$(CXX) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		--prefix=$(PREFIX_PATH)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

