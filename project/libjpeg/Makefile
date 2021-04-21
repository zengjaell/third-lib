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

PROJECT_TARGET          := libjpeg
TARGET_VERSION 			:= 9d
TARGET_DOWNLOAD_PATH 	:= http://www.ijg.org/files/jpegsrc.v$(TARGET_VERSION).tar.gz

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-inside-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)

	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
			CC=$(GCC) \
			--prefix=$(PREFIX_PATH) \
			--build=$(BUILD) \
			--host=$(HOST) \
			--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

$(TARGET_DIR)-inside-src:
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
	$(WGET) $(TARGET_DOWNLOAD_PATH) -O $(PROJECT_TARGET)-$(TARGET_VERSION).$(TAR_SUFFIX)
	$(MKDIR) $(PROJECT_TARGET)-$(TARGET_VERSION)
	$(TAR_CMD) $(@:-inside-src=).$(TAR_SUFFIX) -C $(PROJECT_TARGET)-$(TARGET_VERSION) --strip-components 1
	$(RM) $(@:-inside-src=).$(TAR_SUFFIX)
endif

.PHONY: all clean distclean list

