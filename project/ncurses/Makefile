# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:23
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target         	:= ncurses
target_version 			:= 6.2
target_download_path 	:= http://ftp.gnu.org/gnu/ncurses

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CFLAGS="-pipe" \
		--prefix=$(prefix_path) \
		--program-prefix=$(program_prefix) \
		--build=$(build) \
		--host=$(host) \
		\
		--enable-pc-files \
		--with-pkg-config=$(prefix_path)/lib/pkgconfig \
		--with-shared \
		\
		--without-cxx \
		--without-cxx-binding \
		--without-ada \
		--without-manpages \
		--without-tests \
		--without-progs \
		--without-debug

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
