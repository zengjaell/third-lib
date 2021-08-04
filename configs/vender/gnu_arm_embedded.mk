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

# gcc-arm-none-eabi-10-2020-q4-major, gcc-arm-none-eabi-5_4-2016q3
gcc_version         := gcc-arm-none-eabi-5_4-2016q3

toolchains_path     := $(base_toolchains_path)/$(vender)/$(gcc_version)/bin
gcc_prefix          := arm-none-eabi-
program_prefix      := arm-none-eabi-
host                := arm-none-eabi

cppflags_com        :=
cflags_com          := -specs=nano.specs -specs=nosys.specs
cxxflags_com        :=
ldflags_com         :=
libs_com            :=

prefix_path         ?= $(base_prefix_path)/$(vender)/$(gcc_version)
