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
TARGET_VERSION 			:= 1.1.0g
TARGET_DOWNLOAD_PATH 	:= https://www.openssl.org/source

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make_inside

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		$(MAKE) && make install_sw && make install_man_docs

# 编译平台: 
#     linux-x86_64, linux-armv4
# no-async					作用是不使用GNU的ucontext库
# no-asm					在交叉编译过程中不使用汇编代码代码加速编译过程
# shared 					生成动态连接库
# –-cross-compile-prefix= 	交叉编译工具
ifeq ($(HOST)-x, $(BUILD)-x)
CONFIG_CONTENT := linux-x86_64
else ifeq ($(HOST)-x, arm-linux-x)
CONFIG_CONTENT := linux-armv4 shared no-asm no-async
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

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

