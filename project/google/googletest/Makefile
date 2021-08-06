# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    03/08 2021 17:20
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        03/08 2021      create the file
# 
#     last modified: 03/08 2021 17:20
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := googletest
project_version         := 1.11.0
project_download_url    := https://archive.fastgit.org/google/googletest/archive/refs/tags/release-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(src_path)/$(@:-config=) &&             \
        cmake                                   \
        -H.                                     \
        -B$(build_path)/$(@:-config=)           \
        -DCMAKE_C_COMPILER=$(GCC)               \
        -DCMAKE_CXX_COMPILER=$(CXX)             \
        -DCMAKE_INSTALL_PREFIX="$(prefix_path)" \
        \


	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

