# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/04 2021 17:01
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/04 2021      create the file
# 
#     last modified: 21/04 2021 17:01
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target          := pkg-config
target_version 			:= 0.29.2
target_download_path 	:= https://pkgconfig.freedesktop.org/releases

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	# https://blog.csdn.net/hexf9632/article/details/102625696
	# 编译glib出现的问题，加了下面的echo语句和-C选项
	cd $(build_path)/$(@:-config=) && \
		echo "glib_cv_stack_grows=yes" 			 > config.cache && \
		echo "ac_cv_func_posix_getpwuid_r=yes" 	>> config.cache && \
		echo "glib_cv_uscore=yes" 				>> config.cache && \
		echo "ac_cv_func_posix_getgrgid_r=yes" 	>> config.cache && \
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
			-C \
			--with-internal-glib \

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
