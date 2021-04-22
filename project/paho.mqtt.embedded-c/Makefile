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
top_dir 	:= $(shell pwd)/../..
endif

project_target 			:= paho.mqtt.embedded-c
target_version 			:= 1.1.0
target_download_path 	:= https://codeload.github.com/eclipse/paho.mqtt.embedded-c/tar.gz/v$(target_version)
GITHUB_FLAG 			:= yes

include $(top_dir)/configs/common_var.mk

all: install_depend $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

install_depend:
	$(ECHO) "$(prefix_path)/lib"
	$(MKDIR) "$(prefix_path)/lib"

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd build/$(@:-make_inside=) && \
		export CC=$(CC) export exec_prefix=$(prefix_path) && \
		$(make) && make uninstall && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(target_config), $(wildcard $(target_config)))
	$(MKDIR) build/$(@:-config=)

	cd build/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./
	
	sed -i '/\/sbin\/ldconfig $(DESTDIR)${libdir}/d' build/$(@:-config=)/Makefile

	$(TOUCH) $(target_config)
endif

.PHONY: all clean distclean list install_depend
