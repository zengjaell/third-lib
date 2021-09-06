# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/07 2021 09:16
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/07 2021      create the file
# 
#     last modified: 06/07 2021 09:16
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

project                 := tinyalsa
project_version         := 2.0.0
project_download_url    := https://archive.fastgit.org/tinyalsa/tinyalsa/archive/refs/tags/v$(project_version).tar.gz
# project_version         := 1.1.1
# project_download_url    := https://archive.fastgit.org/tinyalsa/tinyalsa/archive/refs/tags/$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)/

	cd $(build_path)/$(@:-config=) &&                                                       \
        sed -i 's#CROSS_COMPILE =#CROSS_COMPILE = $(cross_gcc)#g'   Makefile &&             \
        sed -i 's#/usr/local#$(prefix_path)#g'                      Makefile

	cd $(build_path)/$(@:-config=) &&                                                       \
        sed -i 's#$$(CROSS_COMPILE)#$(cross_gcc)#g'                 src/Makefile &&         \
        sed -i 's#/usr/local#$(prefix_path)#g'                      src/Makefile

	cd $(build_path)/$(@:-config=) &&                                                       \
        sed -i 's#$$(CROSS_COMPILE)#$(cross_gcc)#g'                 utils/Makefile &&       \
        sed -i 's#/usr/local#$(prefix_path)#g'                      utils/Makefile

	cd $(build_path)/$(@:-config=) &&                                                       \
        sed -i 's#$$(CROSS_COMPILE)#$(cross_gcc)#g'                 examples/Makefile &&    \
        sed -i 's#/usr/local#$(prefix_path)#g'                      examples/Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

