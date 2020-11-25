# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    07/04 2020 09:49
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        07/04 2020      create the file
# 
#     last modified: 07/04 2020 09:49
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := cJSON
TARGET_VERSION 			:= 1.7.14
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/DaveGamble/$(PROJECT_TARGET)/tar.gz/v$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make_inside

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		export CC="$(GCC) -std=c89" export PREFIX=$(PREFIX_PATH) && \
		$(MAKE1) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./
	cd $(BUILD_DIR)/$(@:-config=) && sed -i 's/CC = gcc -std=c89/CC ?= gcc -std=c89/g' Makefile

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

