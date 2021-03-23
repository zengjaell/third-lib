# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    23/03 2021 11:29
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        23/03 2021      create the file
# 
#     last modified: 23/03 2021 11:29
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET 			:= c-ares-cares
TARGET_VERSION 			:= 1_17_1
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/c-ares/c-ares/tar.gz/refs/tags/cares-$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: install_depend $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

install_depend:
	$(ECHO) "$(PREFIX_PATH)/lib"
	$(MKDIR) "$(PREFIX_PATH)/lib"

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && autoreconf -fi
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
        --host=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list install_depend

