# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    30/06 2021 09:57
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        30/06 2021      create the file
# 
#     last modified: 30/06 2021 09:57
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := wpa_supplicant
project_version         := 2.9
project_download_url    := https://w1.fi/releases/wpa_supplicant-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make_inside

include $(sub_target_path)/common_sub_target.mk

depend_lib:

$(target_dir)-make_inside: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make=))
	cd $(build_path)/$(@:-make_inside=) &&              \
        export CC=$(GCC) &&                             \
        export EXTRA_CFLAGS="-I$(include_path)" &&      \
        export LIBS="-L$(lib_path) -lz" &&         \
        export BINDIR=$(prefix_path)/bin &&             \
        export LIBDIR=$(lib_path) &&                    \
        export INCDIR=$(include_path) &&                \
        export PKG_CONFIG_PATH=$(pkg_config_path) &&    \
        $(make) -C wpa_supplicant && make -C wpa_supplicant install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                       \
        $(CP) wpa_supplicant/defconfig wpa_supplicant/.config &&          \
        sed -i 's/#CONFIG_TLS=openssl/CONFIG_TLS=openssl/g' wpa_supplicant/.config

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

