# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:33
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:33
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := zlib
target_version 			:= 1.2.11
target_download_path 	:= https://nchc.dl.sourceforge.net/project/libpng/zlib/$(target_version)

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		export CC=$(CC) export CXX=$(CXX) && \
		$(project_path)/$(@:-config=)/configure \
		--prefix=$(prefix_path)

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list
