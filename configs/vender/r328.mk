# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    r328.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 16:27
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 16:27
# ===============================================================

toolchains_path     := $(base_toolchains_path)/allwinner/toolchain-sunxi-arm9-glibc/toolchain
toolchains_path     := $(toolchains_path)/bin
TOOLCHAINS_INC_DIR  := $(toolchains_path)/include
gcc_prefix          := arm-openwrt-linux-
host                := arm-linux

CFLAGS              :=
LDFLAGS             :=

STAGING_DIR         := $(toolchains_path)
export STAGING_DIR

prefix_path         ?= $(base_prefix_path)/r328
