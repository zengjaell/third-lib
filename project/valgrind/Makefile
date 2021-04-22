# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:40
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target         	:= valgrind
target_version 			:= 3.17.0
target_download_path 	:= https://sourceware.org/pub/valgrind

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-bz2-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd $(@:-config=) && ./autogen.sh
	cd $(@:-config=) && \
		sed 's/armv7\*)/armv7\*|arm\*)/g' ./configure > ./configure-bak && \
		chmod +x ./configure-bak

	cd build/$(@:-config=) && \
		$(project_path)/$(@:-config=)/configure-bak \
		CC=$(GCC) CXX=$(CXX) \
		--program-prefix=$(program_prefix) \
		--prefix=$(prefix_path) \
		--build=$(build) \
		--host=$(host) \
		--target=$(host)

# 注意：只支持 armV7、armV8两种arm CPU架构。
# 
# 注意：特别注意安装目录，否则出现如下错误：
# “valgrind: failed to start tool 'memcheck' for platform 'arm-linux': No such file or directory”
# 增加目录路径：
# 	export VALGRIND_LIB=/lib/valgrind

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean debug
