# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    x86_64.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 17:31
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 17:31
# ===============================================================

toolchains_version  := x86_64-linux-gnu
gcc_name            :=

toolchains_bin_path :=
gcc_prefix          :=
host                := x86_64-linux-gnu

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(platform)/$(toolchains_version)
