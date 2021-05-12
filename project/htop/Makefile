# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:28
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:28
# ===============================================================

ifndef top_dir
top_dir 	:= $(shell pwd)/../..
endif

project_target     		:= htop
target_version 			:= 2.2.0
target_download_path 	:= http://hisham.hm/htop/releases/$(target_version)

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_ncurses

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(src_path)/$(@:-config=) && ./autogen.sh

	cd $(build_path)/$(@:-config=) && \
		$(RM) $(src_path)/$(@:-config=)/config.h && \
		$(src_path)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--program-prefix=$(program_prefix) \
			--prefix=$(prefix_path) \
			--build=$(build) \
        	--host=$(host) \
			\
        	--disable-unicode \
			HTOP_NCURSES_CONFIG_SCRIPT=$(prefix_path)/bin/ncurses6-config \
			PKG_CONFIG_PATH=$(pkg_config_path)

	$(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list

### 运行
#
#### 缺少terminfo环境变量
#
#* 运行htop出现如下问题
#
#```
#  $ htop
#  Error opening terminal: vt102.
#  $
#```
#
#* 查看以下两个变量
#
#```
#  $ echo $TERM
#  $ echo $TERMINFO
#```
#
#* 增加环境变量
#
#```
#  $ vi /etc/profile
#  export TERM=vt102
#  export TERMINFO=/usr/share/terminfo
#```
#> note: 确保在/usr/share/terminfo/v/下，存在vt102这个文件

