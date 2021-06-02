# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    22/04 2021 13:39
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        22/04 2021      create the file
# 
#     last modified: 22/04 2021 13:39
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := pcre2
target_version 			:= 10.36
target_download_path 	:= https://udomain.dl.sourceforge.net/project/pcre/$(project_target)/$(target_version)/$(project_target)-$(target_version).tar.gz

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
			--target=$(host)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
