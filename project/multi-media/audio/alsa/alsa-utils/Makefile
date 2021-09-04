# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    30/07 2021 14:48
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        30/07 2021      create the file
# 
#     last modified: 30/07 2021 14:48
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../../..
endif

project                 := alsa-utils
project_version         := 1.2.5.1
project_download_url    := https://www.alsa-project.org/files/pub/utils/alsa-utils-$(project_version).tar.bz2

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-bz2-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(src_path)/$(@:-config=)/configure         \
            CC=$(GCC) CXX=$(CXX)                    \
            CPPFLAGS="$(cppflags_com)"               \
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
            --with-systemdsystemunitdir=$(prefix_path)/lib/systemd/system/ \
            --with-udev-rules-dir=$(prefix_path)/lib/udev/rules.d/


	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

