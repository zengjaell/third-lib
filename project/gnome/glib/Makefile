# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/04 2021 13:41
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/04 2021      create the file
# 
#     last modified: 21/04 2021 13:41
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := glib
project_version         := 2.68.1
project_download_url    := https://archive.fastgit.org/GNOME/glib/archive/refs/tags/$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-inside-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libffi check_libiconv

$(target_dir)-inside-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make=))
	cd $(build_path)/$(@:-inside-make=) &&  \
        ninja -j$(PARALLEL_JOBS) &&         \
        meson install

$(target_dir)-config: $(target_dir)-rename-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) && \
        echo "[binaries]"                                           > cross_file.txt && \
        echo "c                 = '${cross_gcc}' + 'gcc'"        >> cross_file.txt && \
        echo "cpp               = '${cross_gcc}' + 'g++'"        >> cross_file.txt && \
        echo "ar                = '${cross_gcc}' + 'ar'"         >> cross_file.txt && \
        echo "ld                = '${cross_gcc}' + 'ld'"         >> cross_file.txt && \
        echo "strip             = '${cross_gcc}' + 'strip'"      >> cross_file.txt && \
        \
        echo ""                                                                 >> cross_file.txt && \
        echo "[properties]"                                                     >> cross_file.txt && \
        echo "c_args            = ['-I${include_path}']"                        >> cross_file.txt && \
        echo "c_link_args       = ['-L${lib_path}', '-lz', '-lffi', '-liconv']" >> cross_file.txt && \
        \
        echo ""                                                                 >> cross_file.txt && \
        echo "[host_machine]"                                                   >> cross_file.txt && \
        echo "system            = 'linux'"                                      >> cross_file.txt && \
        echo "cpu_family        = 'arm'"                                        >> cross_file.txt && \
        echo "cpu               = 'armv7'"                                      >> cross_file.txt && \
        echo "endian            = 'little'"                                     >> cross_file.txt && \
        \
        echo ""                                                                 >> cross_file.txt && \
        echo "[project options]"                                                >> cross_file.txt && \
        echo "prefix            = '${prefix_path}'"                             >> cross_file.txt && \
        echo "internal_pcre     = 'true'"                                       >> cross_file.txt && \
        echo "selinux           = 'disabled'"                                   >> cross_file.txt && \
        echo "libelf            = 'disabled'"                                   >> cross_file.txt

		cd $(src_path)/$(@:-config=) && \
            sed -i "/^libffi_dep/a libffi_dep = dependency(\'libffi\', required : false)" meson.build && \
            sed -i "/'ffi_dep'])/d" meson.build && \
            meson \
            --prefix ${prefix_path} \
            --cross-file $(build_path)/$(target_dir)/cross_file.txt \
            $(build_path)/$(target_dir)

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

