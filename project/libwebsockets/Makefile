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

project_target          := libwebsockets
target_version          := 4.2.0
target_download_path    := https://archive.fastgit.org/warmcat/libwebsockets/archive/refs/tags/v$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libuv check_mbedtls

include $(top_dir)/configs/platform/platform_config_tmp.mk

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
        cmake \
        $(src_path)/$(@:-config=) \
        -DCMAKE_INSTALL_PREFIX=$(prefix_path) \
        -DCMAKE_C_COMPILER=$(CC) \
        -DCMAKE_CXX_COMPILER=$(CXX) \
        \
        -DLWS_WITH_LIBUV:BOOL=ON \
        -DLWS_LIBUV_LIBRARIES="$(prefix_path)/lib/libuv.so" \
        -DLWS_LIBUV_INCLUDE_DIRS="$(prefix_path)/include"\
        \
        -DLWS_WITH_ZLIB:BOOL=ON \
        -DLWS_ZLIB_INCLUDE_DIRS="$(prefix_path)/include" \
        -DLWS_ZLIB_LIBRARIES="$(prefix_path)/lib/libz.so" \
        \
        -DLWS_WITH_LWSWS:BOOL=ON \
        -DLWS_WITH_MBEDTLS:BOOL=ON \
        -DLWS_MBEDTLS_LIBRARIES="$(prefix_path)/lib/libmbedcrypto.so;$(prefix_path)/lib/libmbedtls.so;$(prefix_path)/lib/libmbedx509.so" \
        -DLWS_MBEDTLS_INCLUDE_DIRS="$(prefix_path)/include"

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
