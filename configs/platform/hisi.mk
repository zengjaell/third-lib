# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    hisi.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    16/04 2021 15:17
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        16/04 2021      create the file
# 
#     last modified: 16/04 2021 15:17
# ===============================================================

# arm-himix200-linux, arm-hisiv510-linux
toolchains_version  := arm-himix200-linux
gcc_name            := arm-himix200-linux

toolchains_path     := $(base_toolchains_path)/$(platform)
toolchains_bin_path := $(toolchains_path)/$(toolchains_version)/bin
gcc_prefix          := $(gcc_name)-
program_prefix      := $(gcc_name)-
host                := $(gcc_name)

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(platform)/$(toolchains_version)
