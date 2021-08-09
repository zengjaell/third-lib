# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    13/12 2019 15:54
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        13/12 2019      create the file
# 
#     last modified: 13/12 2019 15:54
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../..
endif

project                 := paho.mqtt.embedded-c
project_version         := 1.1.0
project_download_url    := https://archive.fastgit.org/eclipse/paho.mqtt.embedded-c/archive/refs/tags/v$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make_inside=))
	cd $(build_path)/$(@:-make_inside=) && $(make_j1) && make install

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                                   \
        sed -i 's#/usr/local#$(prefix_path)#g'      Makefile &&         \
        sed -i 's#build/output#./#g'                Makefile &&         \
        sed -i '/ldconfig/d'                        Makefile &&         \
        sed -i '/ldconfig/d'                        Makefile &&         \
        sed -i '/ldconfig/d'                        Makefile &&         \
        sed -i '/ldconfig/d'                        Makefile &&         \
        sed -i 's#CC ?= gcc#CC ?= $(GCC)#g'         Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

