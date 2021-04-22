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

ifndef top_dir
top_dir 	:= $(shell pwd)/../../..
endif

project_target_top_dir 	:= audio
project_target 			:= tinyalsa
target_version 			:= 1.1.1
target_download_path 	:= https://codeload.github.com/tinyalsa/tinyalsa/tar.gz/$(target_version)
GITHUB_FLAG 			:= yes

prefix_path 			:= $(target_PATH)/../../$(INSTALL_DIR)

CONFIGS_DIR := $(top_dir)/configs

include $(CONFIGS_DIR)/common_var.mk

# FIXME
target_PATH 			:= $(PROJECT_DIR)/$(project_target_top_dir)/$(project_target)

all: $(target_dir)-make_inside

include $(CONFIGS_DIR)/common_sub_target.mk

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_DIR)/$(@:-make_inside=) && \
		export CROSS_COMPILE=$(cross_prefix) export PREFIX=$(prefix_path) && \
		$(make) && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) $(build_DIR)/$(@:-config=)
	cd $(build_DIR)/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list

