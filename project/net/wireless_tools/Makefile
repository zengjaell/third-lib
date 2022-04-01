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

project                 := wireless_tools
project_version         := 29
project_download_url    := https://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.$(project_version).tar.gz --no-check-certificate

include $(top_dir)/configs/common_var.mk

target_dir      := $(project).$(project_version)

all: depend_lib $(target_dir)-make-inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make-inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make-inside=))
	cd $(build_path)/$(@:-make-inside=) && \
        export PREFIX=$(prefix_path) && \
        $(make) && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                                           \
        sed -i 's#CC = gcc#CC = $(GCC)#g'                       Makefile &&     \
        sed -i 's#AR = ar#AR = $(AR)#g'                         Makefile &&     \
        sed -i 's#RANLIB = ranlib#RANLIB = $(RANLIB)#g'         Makefile &&     \
        sed -i '/LDCONFIG = /a LDFLAGS += -Wl,-rpath=../lib'    Makefile &&     \
        sed -i 's#\/sbin\/#\/bin\/#g'                           Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

