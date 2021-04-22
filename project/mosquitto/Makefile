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

project_target 			:= mosquitto
target_version 			:= 2.0.10
target_download_path 	:= https://mosquitto.org/files/source

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_cjson check_openssl check_cares check_libwebsockets

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd build/$(@:-make_inside=) && \
		export CC=gcc \
		export CROSS_COMPILE=$(cross_prefix) \
		export CPPFLAGS=-I$(prefix_path)/include \
		export LDFLAGS="-L$(prefix_path)/lib -lssl -lcrypto -lcares -lz" \
		export prefix=$(prefix_path) && \
		$(make) && make uninstall && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./

	sed -i 's/WITH_SRV:=no/WITH_SRV:=yes/' build/$(@:-config=)/config.mk
	sed -i 's/WITH_DOCS:=yes/WITH_SRV:=no/' build/$(@:-config=)/config.mk
	sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' build/$(@:-config=)/config.mk

	sed -i 's/{DESTDIR}\/etc\/mosquitto/{prefix}\/etc\/mosquitto/g' build/$(@:-config=)/Makefile

	exit
	
	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list
