# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/07 2021 20:29
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/07 2021      create the file
# 
#     last modified: 21/07 2021 20:29
# ===============================================================

ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project                 := squashfs
project_version         := 4.2
project_download_url    := https://udomain.dl.sourceforge.net/project/squashfs/squashfs/squashfs$(project_version)/squashfs$(project_version).tar.gz

target_dir              := $(project)$(project_version)

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	
	cd $(build_path)/$(@:-make_inside=)/squashfs-tools &&                       \
		make EXTRA_CFLAGS="$(cppflags_com)" EXTRA_LDFLAGS="$(ldflags_com)" &&   \
		make INSTALL_DIR=$(prefix_path) install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                                           \
        $(CP) $(src_path)/$(@:-config=)/* ./ &&                                 \
        sed -i 's/#XZ_SUPPORT/XZ_SUPPORT/g' squashfs-tools/Makefile &&          \
        sed -i '/#include <sys\/sysinfo.h>/a #include <sys/sysmacros.h>' squashfs-tools/mksquashfs.c && \
        sed -i '/#include <sys\/types.h>/a #include <sys/sysmacros.h>' squashfs-tools/unsquashfs.c

	$(TOUCH) $(config_ok_mark_path)
endif


.PHONY: all clean distclean list

