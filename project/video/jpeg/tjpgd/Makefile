# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    20/04 2021 16:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        20/04 2021      create the file
# 
#     last modified: 20/04 2021 16:23
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

project                 := tjpgd
project_version         := 3
project_download_url    := http://elm-chan.org/fsw/tjpgd/arc/tjpgd$(project_version).zip

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-config

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-zip-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

