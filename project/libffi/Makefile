# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:44
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:44
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target 			:= libffi
target_version 			:= 3.3
target_download_path 	:= ftp://sourceware.org/pub/libffi

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		$(project_path)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--prefix=$(prefix_path) \
		--build=$(build) \
		--host=$(host) \
		--target=$(host)

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list
