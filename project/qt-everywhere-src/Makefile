# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    19/05 2021 17:28
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        19/05 2021      create the file
# 
#     last modified: 19/05 2021 17:28
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project                 := qt-everywhere-src
target_version_major    := 5.12
target_version_patch    := 11
project_version         := $(target_version_major).$(target_version_patch)
mirror_url              := http://mirrors.tuna.tsinghua.edu.cn/qt
project_download_url    := $(mirror_url)/archive/qt/$(target_version_major)/$(project_version)/single/$(project)-$(project_version).tar.xz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libpng check_jpeglib check_tslib

_common_base_var :=                         \
    -prefix ${prefix_path}                  \
    -opensource                             \
    -confirm-license                        \
    -release                                \
    -shared                                 \
    -optimize-size                          \
    -ccache                                 \
    -pch

_common_3rd_lib :=                          \
    -I${include_path}                       \
    -L${lib_path}                           \
    -system-zlib                            \
    -system-libpng                          \
    -system-libjpeg

$(target_dir)-config: $(target_dir)-xz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	case $(host) in                                         \
        x86*)                                               \
            cd $(build_path)/$(@:-config=) &&               \
                $(src_path)/$(@:-config=)/configure         \
                    $(_common_base_var)                     \
                    $(_common_3rd_lib)                      \
                    \
                    -nomake tests                           \
                    -nomake examples                        \
                    -skip qtdoc                             \
                    -skip qtwebengine                       \
            ;;                                              \
        arm-*|aarch*)                                       \
            $(CP) $(project_path)/$(project)/linux-arm-$(vender)-g++ $(src_path)/$(@:-config=)/qtbase/mkspecs && \
                                                            \
            cd $(build_path)/$(@:-config=) &&               \
                $(src_path)/$(@:-config=)/qtbase/configure  \
                    $(_common_base_var)                     \
                    $(_common_3rd_lib)                      \
                    \
                    -xplatform linux-arm-$(vender)-g++      \
                    -no-dbus                                \
                    -no-opengl                              \
                    -no-iconv                               \
                    -tslib                                  \
            ;;                                              \
    esac

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

