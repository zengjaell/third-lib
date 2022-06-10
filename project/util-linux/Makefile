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
top_dir := $(shell pwd)/../..
endif

project                 := util-linux
project_version         := 2.38
project_download_url    := https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v$(project_version)/util-linux-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_ncurses

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(src_path)/$(@:-config=) && \
        ./autogen.sh

	cd $(build_path)/$(@:-config=) &&               \
        $(src_path)/$(@:-config=)/configure         \
            CC=$(GCC) CXX=$(CXX)                    \
            CPPFLAGS="$(cppflags_com)"              \
            CFLAGS="$(cflags_com)"                  \
            CXXFLAGS="$(cxxflags_com)"              \
            LDFLAGS="$(ldflags_com)"                \
            LIBS="$(libs_com)"                      \
            PKG_CONFIG_PATH="$(pkg_config_path)"    \
            --prefix=$(prefix_path)                 \
            --build=$(build)                        \
            --host=$(host)                          \
            --target=$(host)                        \
            \


	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

# 需要编译两次
# 第一次编译出错后，先执行`make install-usrlib_execLTLIBRARIES`，安装库文件
# 第二次正常编译即可，执行`make`
# 第三次安装，执行`sudo make install`

