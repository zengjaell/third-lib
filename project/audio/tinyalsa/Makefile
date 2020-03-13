# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    12/03 2020 17:21
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        12/03 2020      create the file
# 
#     last modified: 12/03 2020 17:21
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../../..
endif

PROJECT_TARGET_TOP_DIR 	:= audio
PROJECT_TARGET 			:= tinyalsa
TARGET_VERSION 			:= 1.1.1
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/tinyalsa/tinyalsa/tar.gz/$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

# FIXME
TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP_DIR)/$(PROJECT_TARGET)

all: $(TARGET_DIR)-make_inside

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		export CROSS_COMPILE=$(CROSS_PREFIX) export PREFIX=$(PREFIX_PATH) && \
		$(MAKE1) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

