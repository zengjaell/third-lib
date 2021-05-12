# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    12/05 2021 11:39
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        12/05 2021      create the file
# 
#     last modified: 12/05 2021 11:39
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := libevdev
target_version 			:= 1.11.0
target_download_path 	:= https://www.freedesktop.org/software/libevdev

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

# 临时指定配置信息
# prefix_path := /opt/data/nfs/meian/3rd_lib/libevdev

$(target_dir)-config: $(target_dir)-xz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
		$(src_path)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--prefix=$(prefix_path) \
			--build=$(build) \
			--host=$(host) \
			--target=$(host)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
