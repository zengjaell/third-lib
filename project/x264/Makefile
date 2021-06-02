# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    02/06 2021 15:09
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        02/06 2021      create the file
# 
#     last modified: 02/06 2021 15:09
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project_target          := x264
target_version          := stable
target_download_path    := https://code.videolan.org/videolan/x264/-/archive/$(target_version)/x264-$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib

# 临时指定配置信息
# prefix_path := /opt/data/nfs/meian/3rd_lib/tslib
# pkg_config_path := $(base_prefix_path)/hisi-linux/$(platform)/lib/pkgconfig

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                       \
        $(src_path)/$(@:-config=)/configure                 \
            --prefix=$(prefix_path)                         \
            --cross-prefix=$(cross_prefix)                  \
            --host=$(host)                                  \
            --enable-static                                 \
            --enable-shared                                 \
            --extra-cflags="$(cflags_com) $(cppflags_com)"  \
            --extra-ldflags="$(ldflags_com)"                \
            --extra-asflags=                                \
            --extra-rcflags=

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
