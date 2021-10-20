# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    02/06 2021 10:36
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        02/06 2021      create the file
# 
#     last modified: 02/06 2021 10:36
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../..
endif

project                 := ffmpeg
project_version         := 4.4
project_download_url    := http://ffmpeg.org/releases/ffmpeg-$(project_version).tar.bz2

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_zlib check_libx264

_common_base_var :=                                     \
    --prefix=$(prefix_path)                             \
    --cross-prefix=$(cross_gcc)                         \
    --extra-cflags="$(cflags_com) $(cppflags_com)"      \
    --extra-cxxflags="$(cxxflags_com) $(cppflags_com)"  \
    --extra-ldflags="$(ldflags_com)"                    \
    --extra-libs="$(libs_com) -lz"                      \
    --extra-objcflags=                                  \
    --extra-ldexeflags=                                 \
    --extra-ldsoflags=                                  \
    --enable-shared                                     \
    \
    --enable-gpl                                        \
    --enable-zlib                                       \
    \
    --enable-small                                      \
    \
    --disable-encoders                                  \
    --enable-libx264                                    \
    --enable-encoder=libx264                            \
    \
    --disable-muxers                                    \
    --enable-muxer=mov                                  \
    --enable-muxer=mp4                                  \
    --enable-muxer=avi                                  \
    \
    --disable-filters                                   \
    --enable-filter=anull                               \
    --enable-filter=null                                \
    --enable-filter=aresample                           \
    --enable-filter=pad                                 \
    --enable-filter=scale                               \
    --enable-filter=overlay                             \
    --enable-filter=amix                                \
    --enable-filter=aresample                           \
    \
    --disable-demuxers                                  \
    --enable-demuxer=h264                               \
    --enable-demuxer=avi                                \
    --enable-demuxer=mpc                                \
    --enable-demuxer=mov                                \
    \
    --disable-parsers                                   \
    --enable-parser=h264                                \
    \
    --disable-protocols                                 \
    --enable-protocol=file                              \
    \
    --disable-bsfs                                      \
    --enable-bsf=h264_mp4toannexb                       \
    \
    --disable-indevs                                    \
    --disable-outdevs                                   \
    --disable-ffprobe                                   \
    --disable-debug                                     \
    --disable-doc

    # --enable-bsf=aac_adtstoasc                          \
    # --enable-parser=aac                                 \
    # --enable-libx265

$(target_dir)-config: $(target_dir)-bz2-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	case $(host) in                                                     \
        x86*)                                                           \
            cd $(build_path)/$(@:-config=) &&                           \
                $(src_path)/$(@:-config=)/configure                     \
                    $(_common_base_var)                                 \
                    --disable-x86asm                                    \
            ;;                                                          \
        arm-*)                                                          \
            cd $(build_path)/$(@:-config=) &&                           \
                $(src_path)/$(@:-config=)/configure                     \
                    $(_common_base_var)                                 \
                    \
                    --enable-cross-compile                              \
                    --target-os=linux                                   \
                    --arch=arm                                          \
            ;;                                                          \
    esac

	$(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list

