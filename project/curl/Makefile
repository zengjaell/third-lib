# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:19
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:19
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := curl
target_version 			:= 7.76.1
target_download_path 	:= https://curl.se/download

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_openssl

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--program-prefix=$(program_prefix) \
		--prefix=$(prefix_path) \
		--host=$(host) \
		--build=$(build) \
		\
		--with-zlib=$(prefix_path) \
		--with-ssl=$(prefix_path)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
