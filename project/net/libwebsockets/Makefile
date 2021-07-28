# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    23/03 2021 11:29
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        23/03 2021      create the file
# 
#     last modified: 23/03 2021 11:29
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project                 := libwebsockets
project_version         := 4.2.0
project_download_url    := https://archive.fastgit.org/warmcat/libwebsockets/archive/refs/tags/v$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libuv check_mbedtls

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                       \
        cmake                                               \
        $(src_path)/$(@:-config=)                           \
        -DCMAKE_INSTALL_PREFIX=$(prefix_path)               \
        -DCMAKE_C_COMPILER=$(CC)                            \
        -DCMAKE_CXX_COMPILER=$(CXX)                         \
        \
        -DLWS_WITH_LIBUV:BOOL=ON                            \
        -DLWS_LIBUV_LIBRARIES="$(lib_path)/libuv.so"        \
        -DLWS_LIBUV_INCLUDE_DIRS="$(include_path)"          \
        \
        -DLWS_WITH_ZLIB:BOOL=ON                             \
        -DLWS_ZLIB_INCLUDE_DIRS="$(include_path)"           \
        -DLWS_ZLIB_LIBRARIES="$(lib_path)/libz.so"          \
        \
        -DLWS_WITH_LWSWS:BOOL=ON                            \
        -DLWS_WITH_MBEDTLS:BOOL=ON                          \
        -DLWS_MBEDTLS_LIBRARIES="$(lib_path)/libmbedcrypto.so;$(lib_path)/libmbedtls.so;$(lib_path)/libmbedx509.so" \
        -DLWS_MBEDTLS_INCLUDE_DIRS="$(include_path)"

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

