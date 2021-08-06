# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    12/05 2021 11:44
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        12/05 2021      create the file
# 
#     last modified: 12/05 2021 11:44
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := tslib
project_version         := 1.22
project_download_url    := https://archive.fastgit.org/libts/tslib/archive/refs/tags/$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_libevdev

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(src_path)/$(@:-config=) && \
        ./autogen.sh

	cd $(build_path)/$(@:-config=) &&               \
        $(src_path)/$(@:-config=)/configure         \
            CC=$(GCC) CXX=$(CXX)                    \
            CPPFLAGS="$(cppflags_com)"              \
            CFLAGS="$(cflags_com)"                  \
            CXXFLAGS="$(cxxflags_com)"              \
            LDFLAGS="$(ldflags_com)"                \
            LIBS="$(libs_com)"                      \
            PKG_CONFIG_PATH="$(pkg_config_path)"    \
            --prefix=$(prefix_path)                 \
            --build=$(build)                        \
            --host=$(host)                          \
            --target=$(host)                        \
            \
            --enable-input-evdev

	cd $(build_path)/$(@:-config=) && \
        sed -i '/#define VERSION/a #define ABS_MT_TOOL_Y 0x3d' config.h && \
        sed -i '/#define VERSION/a #define ABS_MT_TOOL_X 0x3c' config.h

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

