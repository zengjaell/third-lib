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

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project_target          := cJSON
target_version          := 1.7.14
target_download_path    := https://archive.fastgit.org/DaveGamble/cJSON/archive/refs/tags/v$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_path)/$(@:-make_inside=) && \
        export CC="$(GCC) -std=c89" export PREFIX=$(prefix_path) && \
        $(make_j1) && make install

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
        $(CP) $(src_path)/$(@:-config=)/* ./ && \
        sed -i 's/CC = gcc -std=c89/CC ?= gcc -std=c89/g' Makefile

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
