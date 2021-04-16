# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 10:15
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 10:15
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := openssl
TARGET_VERSION 			:= 1.1.1i
TARGET_DOWNLOAD_PATH 	:= https://www.openssl.org/source

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: depend_lib $(TARGET_DIR)-make_inside

ZLIB_FILE := $(PREFIX_PATH)/include/zlib.h
depend_lib:
ifneq ($(ZLIB_FILE), $(wildcard $(ZLIB_FILE)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		$(MAKE) && make install

CONFIG_COM := no-tests \
	zlib \
	--with-zlib-include=$(PREFIX_PATH)/include \
	--with-zlib-lib=$(PREFIX_PATH)/lib

ifeq ($(HOST)-x, $(BUILD)-x)
CONFIG_CONTENT := linux-x86_64
else ifeq ($(HOST)-x, arm-linux-x)
CONFIG_CONTENT := linux-generic32 shared no-async $(CONFIG_COM)
else ifeq ($(HOST)-x, mips-linux-gnu-x)
endif

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/Configure \
		$(CONFIG_CONTENT) \
		--cross-compile-prefix=$(CROSS_PREFIX) \
		--prefix=$(PREFIX_PATH) 

	sed -i 's/^install: install_sw install_ssldirs install_docs/install: install_sw install_ssldirs/' $(BUILD_DIR)/$(@:-config=)/Makefile

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

