# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/07 2021 09:16
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/07 2021      create the file
# 
#     last modified: 06/07 2021 09:16
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project_target          := tinyalsa
target_version          := 2.0.0
target_download_path    := https://archive.fastgit.org/tinyalsa/tinyalsa/archive/refs/tags/v$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

include $(top_dir)/configs/platform/platform_config_tmp.mk

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_path)/$(@:-make_inside=) && \
        export CROSS_COMPILE=$(cross_prefix) export PREFIX=$(prefix_path) && \
        $(make) && make install

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)/

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
