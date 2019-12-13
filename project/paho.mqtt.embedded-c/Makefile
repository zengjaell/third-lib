# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    13/12 2019 15:54
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        13/12 2019      create the file
# 
#     last modified: 13/12 2019 15:54
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET 			:= paho.mqtt.embedded-c
TARGET_VERSION 			:= 1.1.0
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/eclipse/paho.mqtt.embedded-c/tar.gz/v$(TARGET_VERSION)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make_inside

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		export CC=$(CC) export exec_prefix=$(PREFIX_PATH) && \
		$(MAKE1) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

