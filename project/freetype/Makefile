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

project_target          := freetype
target_version 			:= 2.10.4
target_download_path 	:= https://iweb.dl.sourceforge.net/project/freetype/freetype2/$(target_version)

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libpng

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--prefix=$(prefix_path) \
			--build=$(build) \
			--host=$(host) \
			--target=$(host) \
			\
			--with-zlib=yes \
			--with-png=yes \
			--with-harfbuzz=no \
			PKG_CONFIG_PATH=$(prefix_path)/lib/pkgconfig

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
