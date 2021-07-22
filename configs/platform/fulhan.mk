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

toolchains_version  := molchipv500-armgcc-uclibc
gcc_name            := arm-mol-linux-uclibcgnueabihf

toolchains_bin_path := $(base_toolchains_path)/$(platform)/$(toolchains_version)/bin
gcc_prefix          := $(gcc_name)-
program_prefix      := $(gcc_name)-
host                := $(gcc_name)

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(platform)/$(toolchains_version)
