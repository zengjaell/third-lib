# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    ats3607d.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/11 2020 16:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/11 2020      create the file
# 
#     last modified: 25/11 2020 16:32
# ===============================================================

toolchains_path     := $(base_toolchains_path)/gnu_arm_embedded/gcc-arm-none-eabi-10-2020-q4-major
toolchains_path     := $(toolchains_path)/bin
gcc_prefix          := arm-none-eabi-
host                := arm-linux

CFLAGS              :=
LDFLAGS             :=

prefix_path         ?= $(base_prefix_path)/ats3607d
