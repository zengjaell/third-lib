# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    04/06 2021 14:35
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        04/06 2021      create the file
# 
#     last modified: 04/06 2021 14:35
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project                 := giflib
project_version         := 5.2.1
project_download_url    := https://udomain.dl.sourceforge.net/project/giflib/giflib-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_path)/$(@:-make_inside=) &&  \
        export CC=$(CC)                     \
        export PREFIX=$(prefix_path)        \
        export AR=$(AR) &&                  \
        $(make_j1) && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* ./ &&     \
        sed -i 's/PREFIX =/PREFIX ?=/g' Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

