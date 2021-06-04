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

project_target          := qt-everywhere-src
target_version_major    := 5.15
target_version_patch    := 2
target_version          := $(target_version_major).$(target_version_patch)
mirror_url              := http://mirrors.tuna.tsinghua.edu.cn/qt
target_download_path    := $(mirror_url)/archive/qt/$(target_version_major)/$(target_version)/single/$(project_target)-$(target_version).tar.xz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_tslib

include $(top_dir)/configs/platform/platform_config_tmp.mk

$(target_dir)-config: $(target_dir)-xz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	case $(host) in                                         \
        x86*)                                               \
            cd $(build_path)/$(@:-config=) &&               \
                $(src_path)/$(@:-config=)/configure         \
                    -prefix ${prefix_path}                  \
                    -opensource                             \
                    -confirm-license                        \
                    -release                                \
                    -shared                                 \
                    -optimize-size                          \
                    -ccache                                 \
                    -pch                                    \
                    -I${include_path}/                      \
                    -L${lib_path}                           \
                    -nomake tests                           \
                    -nomake examples                        \
                    -skip qtwebengine                       \
            ;;                                              \
        arm-*|aarch*)                                       \
            $(CP) $(project_path)/$(project_target)/linux-arm-$(platform)-g++ $(src_path)/$(@:-config=)/qtbase/mkspecs && \
                                                            \
            cd $(build_path)/$(@:-config=) &&               \
                $(src_path)/$(@:-config=)/qtbase/configure  \
                    -prefix ${prefix_path}                  \
                    -opensource                             \
                    -confirm-license                        \
                    -release                                \
                    -shared                                 \
                    -optimize-size                          \
                    -ccache                                 \
                    -pch                                    \
                    -I${include_path}/                      \
                    -L${lib_path}                           \
                    -nomake tests                           \
                    -nomake examples                        \
                    -no-dbus                                \
                    -no-iconv                               \
                    \
                    -tslib                                  \
                    -no-opengl                              \
                    -xplatform linux-arm-$(platform)-g++    \
            ;;                                              \
    esac

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
