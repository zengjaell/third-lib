# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:23
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

project                 := ncurses
project_version         := 6.1
project_download_url    := http://ftp.gnu.org/gnu/ncurses/ncurses-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside_1 $(target_dir)-make_inside_2

$(target_dir)-make_inside_1: $(target_dir)-config_1
	$(call echo-make-msg, $(@:-inside-make_inside_1=))
	cd $(build_path)/$(@:-make_inside_1=) && $(make) && make install

$(target_dir)-make_inside_2: $(target_dir)-config_2
	$(call echo-make-msg, $(@:-inside-make_inside_2=))
	cd $(build_path)/$(@:-make_inside_2=) && $(make) && make install

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config_1: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config_1=)

	cd $(build_path)/$(@:-config_1=) &&               \
        $(src_path)/$(@:-config_1=)/configure         \
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
            --enable-pc-files                       \
            --with-pkg-config=$(lib_path)/pkgconfig \
            --with-termlib                          \
            --with-shared                           \
            \
            --without-progs                         \
            --without-tests                         \
            --without-debug                         \
            --without-manpages
endif

$(target_dir)-config_2: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config_2=)

	cd $(build_path)/$(@:-config_2=) &&               \
        $(src_path)/$(@:-config_2=)/configure         \
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
            --enable-pc-files                       \
            --with-pkg-config=$(lib_path)/pkgconfig \
            --with-termlib                          \
            --with-shared                           \
            \
            --without-progs                         \
            --without-tests                         \
            --without-debug                         \
            --without-manpages                      \
            --enable-widec
endif

.PHONY: all clean distclean list

