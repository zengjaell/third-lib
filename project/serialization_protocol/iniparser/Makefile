# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:37
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:37
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := iniparser
project_version         := 4.1
project_download_url    := https://archive.fastgit.org/ndevilla/iniparser/archive/refs/tags/v$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        sed -i 's#?= gcc#= $(GCC)#g'                                                    Makefile && \
        sed -i 's#?= ar#= $(AR)#g'                                                      Makefile && \
        sed -i 's#-Wl,-rpath -Wl,/usr/lib -Wl,-rpath,/usr/lib#-Wl,-rpath=$(lib_path)#g' Makefile && \
        sed -i '/default/a \\tln -s libiniparser.so.1 $(lib_path)/libiniparser.so'      Makefile && \
        sed -i '/default/a \\t$(CP) libiniparser.so.1 $(lib_path)'                      Makefile && \
        sed -i '/default/a \\t$(CP) src\/iniparser.h $(include_path)'                   Makefile && \
        sed -i '/default/a \\t$(CP) src\/dictionary.h $(include_path)'                  Makefile && \
        sed -i '/default/a \\t$(RM) $(lib_path)/libiniparser.so'                        Makefile && \
        sed -i '/default/a \\t$(MKDIR) $(lib_path) $(include_path)'                     Makefile && \
        sed -i '/default/a install:'                                                    Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

