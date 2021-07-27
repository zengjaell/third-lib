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

project                 := mosquitto
project_version         := 2.0.10
project_download_url    := https://mosquitto.org/files/source/mosquitto-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_cjson check_mbedtls check_cares check_libwebsockets

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(build_path)/$(@:-make_inside=) &&          \
        export CC=gcc                               \
        export CROSS_COMPILE=$(cross_gcc)        \
        export CPPFLAGS="-I$(include_path) -pipe"   \
        export LDFLAGS="-L$(lib_path) -lmbedcrypto -lmbedtls -lmbedx509 -luv -lssl -lcrypto -lcares -lz" \
        export prefix=$(prefix_path) &&             \
        $(make) && make uninstall && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
        $(CP) $(src_path)/$(@:-config=)/* ./

	cd $(build_path)/$(@:-config=) && \
        sed -i 's/WITH_SRV:=no/WITH_SRV:=yes/' config.mk && \
        sed -i 's/WITH_DOCS:=yes/WITH_SRV:=no/' config.mk && \
        sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' config.mk && \
        sed -i 's/{DESTDIR}\/etc\/mosquitto/{prefix}\/etc\/mosquitto/g' Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

