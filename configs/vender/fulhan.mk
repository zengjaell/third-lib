# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    fulhan.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    22/07 2021 16:53
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        22/07 2021      create the file
# 
#     last modified: 22/07 2021 16:53
# ===============================================================

gcc_version         := molchipv500-armgcc-uclibc

toolchains_path     := $(base_toolchains_path)/$(vender)/$(gcc_version)/bin
gcc_prefix          := arm-mol-linux-uclibcgnueabihf-
program_prefix      := arm-mol-linux-uclibcgnueabihf-
host                := arm-mol-linux

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(vender)/$(gcc_version)
