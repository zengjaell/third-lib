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
top_dir     := $(shell pwd)/../../..
endif

project                 := glog
project_version         := 0.5.0
project_download_url    := https://archive.fastgit.org/google/glog/archive/refs/tags/v$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(src_path)/$(@:-config=) && \
        $(RM) $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo "set(CMAKE_C_COMPILER $(GCC))"         >  $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo "set(CMAKE_CXX_COMPILER $(CXX))"       >> $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo ""                                     >> $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo "set(CMAKE_CXX_STANDARD 11)"           >> $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo "set(CMAKE_CXX_STANDARD_REQUIRED ON)"  >> $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake && \
        echo "set(CMAKE_CXX_EXTENSIONS OFF)"        >> $(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake

	cd $(src_path)/$(@:-config=) &&                 \
        cmake                                       \
        -H.                                         \
        -B$(build_path)/$(@:-config=)               \
        -DCMAKE_INSTALL_PREFIX="$(prefix_path)"     \
        -DCMAKE_TOOLCHAIN_FILE="$(src_path)/$(@:-config=)/toolchains/cross_gcc.cmake"

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

