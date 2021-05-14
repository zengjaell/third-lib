# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    09/12 2019 10:45
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        09/12 2019      create the file
# 
#     last modified: 09/12 2019 10:45
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := libpcap
target_version 			:= 1.9.1
target_download_path 	:= http://www.tcpdump.org/release

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && 				\
		$(src_path)/$(@:-config=)/configure 		\
			CC=$(GCC) CXX=$(CXX) 					\
			CPPFLAGS="$(cppflags_com)" 				\
			CFLAGS="$(cflags_com)" 					\
			CXXFLAGS="$(cxxflags_com)" 				\
			LDFLAGS="$(ldflags_com)" 				\
			LIBS="$(libs_com)" 						\
			PKG_CONFIG_PATH="$(pkg_config_path)" 	\
			--prefix=$(prefix_path) 				\
			--build=$(build) 						\
			--host=$(host) 							\
			--target=$(host) 						\
													\
			--with-pcap=linux

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
