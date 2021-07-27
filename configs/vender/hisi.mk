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
gcc_version         := arm-himix200-linux

toolchains_path     := $(base_toolchains_path)/$(vender)/$(gcc_version)/bin
gcc_prefix          := arm-himix200-linux-
program_prefix      := arm-himix200-linux-
host                := arm-himix200-linux

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(vender)/$(gcc_version)
