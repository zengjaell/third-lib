# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    29/06 2021 09:34
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        29/06 2021      create the file
# 
#     last modified: 29/06 2021 09:34
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := jsoncpp
project_version         := 1.9.4
project_download_url    := https://archive.fastgit.org/open-source-parsers/jsoncpp/archive/refs/tags/$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        cmake $(src_path)/$(@:-config=)             \
        -DCMAKE_INSTALL_PREFIX=${prefix_path}       \
        \
        -DJSONCPP_WITH_TESTS=off                    \
        \
        -DCMAKE_SYSTEM_NAME="Linux"                 \
        -DCMAKE_C_COMPILER=${CC}                    \
        -DCMAKE_CXX_COMPILER=${CXX}                 \
        -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER   \
        -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY    \
        -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

