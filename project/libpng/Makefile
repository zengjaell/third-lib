# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    20/04 2021 16:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        20/04 2021      create the file
# 
#     last modified: 20/04 2021 16:23
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := libpng
target_version 			:= 1.6.37
target_version_2  		:= 16
target_download_path 	:= https://nchc.dl.sourceforge.net/project/libpng/libpng$(target_version_2)/$(target_version)

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--prefix=$(prefix_path) \
			CPPFLAGS="-I$(prefix_path)/include" \
			LDFLAGS="-L$(prefix_path)/lib" \
			--build=$(build) \
			--host=$(host) \
			--target=$(host)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
