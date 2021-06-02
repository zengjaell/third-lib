# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    aarch64-linux-gnu.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    01/06 2021 20:18
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        01/06 2021      create the file
# 
#     last modified: 01/06 2021 20:18
# ===============================================================

toolchains_version  := gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
gcc_name            := aarch64-linux-gnu

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
