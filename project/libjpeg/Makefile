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
top_dir 	:= $(shell pwd)/../..
endif

project_target          := libjpeg
target_version 			:= 9d
target_download_path 	:= http://www.ijg.org/files/jpegsrc.v$(target_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

$(target_dir)-config: $(target_dir)-jpeg-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		$(project_path)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--prefix=$(prefix_path) \
			--build=$(build) \
			--host=$(host) \
			--target=$(host)

	$(TOUCH) $(target_config)
endif

$(target_dir)-jpeg-src:
ifneq ($(target_dir), $(wildcard $(target_dir)))
	$(WGET) $(target_download_path) -O $(project_target)-$(target_version).tar.gz
	$(MKDIR) $(project_target)-$(target_version)
	$(TAR_GZ) $(@:-jpeg-src=).tar.gz -C $(project_target)-$(target_version) --strip-components 1
	$(RM) $(@:-jpeg-src=).tar.gz
endif

.PHONY: all clean distclean list
