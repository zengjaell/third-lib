# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    02/06 2021 10:36
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        02/06 2021      create the file
# 
#     last modified: 02/06 2021 10:36
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project                 := FFmpeg
project_version         := n4.4
project_download_url    := https://archive.fastgit.org/FFmpeg/FFmpeg/archive/refs/tags/$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libiconv check_libx264

_common_base_var :=                                     \
    --prefix=$(prefix_path)                             \
    --cross-prefix=$(cross_gcc)                         \
    --extra-cflags="$(cflags_com) $(cppflags_com)"      \
    --extra-cxxflags="$(cxxflags_com) $(cppflags_com)"  \
    --extra-ldflags="$(ldflags_com)"                    \
    --extra-libs="$(libs_com) -lz -liconv"              \
    --extra-objcflags=                                  \
    --extra-ldexeflags=                                 \
    --extra-ldsoflags=                                  \
    --enable-shared                                     \
    \
    --enable-gpl                                        \
    --enable-iconv                                      \
    --enable-zlib                                       \
    --enable-libx264                                    \
    --disable-debug                                     \
    --disable-doc

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	case $(host) in                                                     \
        x86*)                                                           \
            cd $(build_path)/$(@:-config=) &&                           \
                $(src_path)/$(@:-config=)/configure                     \
                    $(_common_base_var)                                 \
                    --disable-x86asm                                    \
            ;;                                                          \
        arm-*)                                                          \
            cd $(build_path)/$(@:-config=) &&                           \
                $(src_path)/$(@:-config=)/configure                     \
                    $(_common_base_var)                                 \
                    \
                    --enable-cross-compile                              \
                    --target-os=linux                                   \
                    --arch=arm                                          \
            ;;                                                          \
    esac

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

