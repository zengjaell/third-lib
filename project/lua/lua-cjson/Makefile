# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:34
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:34
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../../..
endif

project                 := lua-cjson
project_version         := 2.1.0
project_download_url    := https://kyne.com.au/~mark/software/download/lua-cjson-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_lua

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                       \
        sed -i 's#/usr/local#$(prefix_path)#g'  Makefile && \
        sed -i 's#$$(CC)#$(GCC)#g'              Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

