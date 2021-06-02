# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    rk3308.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 17:42
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 17:42
# ===============================================================

toolchains_path     := $(base_toolchains_path)/rk3308/host
toolchains_bin_path := $(toolchains_path)/bin
gcc_prefix          := arm-linux-
host                := arm-linux

CFLAGS              :=
LDFLAGS             :=

prefix_path         ?= $(base_prefix_path)/rk3308
