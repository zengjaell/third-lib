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
top_dir := $(shell pwd)/../../..
endif

project                 := zlib
project_version         := 1.2.11
project_download_url    := https://nchc.dl.sourceforge.net/project/libpng/zlib/$(project_version)/zlib-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&           \
        export CC=$(CC)                         \
        export AR=$(AR)                         \
        export CXX=$(CXX)                       \
        export CFLAGS="$(cflags_com)"           \
        export LDFLAGS="$(ldflags_com)" &&      \
        $(src_path)/$(@:-config=)/configure     \
        --prefix=$(prefix_path)

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

