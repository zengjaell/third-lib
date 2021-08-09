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
top_dir := $(shell pwd)/../../..
endif

project                 := tinyalsa
project_version         := 2.0.0
project_download_url    := https://archive.fastgit.org/tinyalsa/tinyalsa/archive/refs/tags/v$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_path)/$(@:-make_inside=) && \
        export CROSS_COMPILE=$(cross_gcc) export PREFIX=$(prefix_path) && \
        $(make) && make install

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)/

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

