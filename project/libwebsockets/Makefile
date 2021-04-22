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
top_dir 	:= $(shell pwd)/../..
endif

project_target 			:= libwebsockets
target_version 			:= 4.2.0
target_download_path 	:= https://archive.fastgit.org/warmcat/libwebsockets/archive/refs/tags/v$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_openssl

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		cmake \
		../../$(@:-config=) \
		-DCmake_INSTALL_PREFIX=$(prefix_path) \
		-DCmake_SYSTEM_NAME=Linux \
		-DCmake_C_COMPILER=$(CC) \
		-DCmake_CXX_COMPILER=$(CXX) \
		\
		-DLWS_WITH_ZLIB=1 \
		-DLWS_ZLIB_INCLUDE_DIRS=$(prefix_path)/include \
		-DLWS_ZLIB_LIBRARIES="$(prefix_path)/lib/libz.so" \
		\
		-DLWS_WITH_HTTP2=1 \
		-DLWS_OPENSSL_INCLUDE_DIRS=$(prefix_path)/include \
		-DLWS_OPENSSL_LIBRARIES="$(prefix_path)/lib/libssl.so;$(prefix_path)/lib/libcrypto.so;"

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list
