# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/12 2019 09:42
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/12 2019      create the file
# 
#     last modified: 25/12 2019 09:42
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../..
endif

project_target  		:= tcpdump
target_version 			:= 4.99.0
target_download_path 	:= https://www.tcpdump.org/release

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_libpcap

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CFLAGS="-pipe -I$(prefix_path)/include" \
		LDFLAGS="-L$(prefix_path)/lib" \
		LIBS="-lpcap" \
		--prefix=$(prefix_path) \
		--build=$(build) \
		--host=$(host) \
		--target=$(host)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
