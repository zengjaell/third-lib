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

ifndef top_dir
top_dir 	:= $(shell pwd)/../../..
endif

project_target_TOP 		:= ffmpeg
project_target  		:= fdk-aac
target_version 			:= 2.0.1
target_download_path 	:= https://downloads.sourceforge.net/opencore-amr

CONFIGS_DIR := $(top_dir)/configs

include $(CONFIGS_DIR)/common_var.mk

target_PATH 			:= $(PROJECT_DIR)/$(project_target_TOP)/$(project_target)
prefix_path 			:= $(target_PATH)/../../$(INSTALL_DIR)

all: $(target_dir)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) $(build_DIR)/$(@:-config=)
	cd $(build_DIR)/$(@:-config=) && \
		$(target_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CFLAGS="-pipe" \
		--program-prefix=$(program_prefix) \
		--prefix=$(prefix_path) \
		--build=$(build) \
		--host=$(host) \
		--target=$(host) \
		--disable-static

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list

