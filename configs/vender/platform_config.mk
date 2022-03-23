# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    platform_config.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 16:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 16:40
# ===============================================================

data_disk_path       := /opt/data
base_toolchains_path := $(data_disk_path)/opt/toolchains
base_prefix_path     := $(data_disk_path)/install

# 可选的平台有: 
#       r328
#       rk3308
#       unione
#       ats3607d
#       hisi
#       fulhan
#       mstar
#       linaro

# 可选的平台和芯片有:
# pc
#   pc-chip
# eeasytech
#   SV823
# arterytek
#   at32f4xx
# ingenic
#   x1830
vender := pc
chip := pc-chip

include $(vender_path)/$(vender)/$(chip)/config.mk

# build为编译的平台，host为运行的平台，target为调试的平台
#
# --host=i686-pc-linux-gnu  指定了生成<可执行文件>运行的平台和系统，运行于X86平台的linux系统
# --host=arm-linux          指定了生成<可执行文件>运行的平台和系统，运行于ARM平台的linux系统
# --target=arm-linux        目标平台是运行于ARM体系结构的linux内核
build   := x86_64-linux-gnu
target  := $(host)

AR              := $(toolchains_path)ar
AS              := $(toolchains_path)as
LD              := $(toolchains_path)ld
NM              := $(toolchains_path)nm
CC              := $(toolchains_path)gcc
GCC             := $(toolchains_path)gcc
CPP             := $(toolchains_path)cpp
CXX             := $(toolchains_path)g++
FC              := $(toolchains_path)gfortran
F77             := $(toolchains_path)gfortran
RANLIB          := $(toolchains_path)ranlib
READELF         := $(toolchains_path)readelf
STRIP           := $(toolchains_path)strip
OBJCOPY         := $(toolchains_path)objcopy
OBJDUMP         := $(toolchains_path)objdump

cppflags_com    += -I$(prefix_path)/include -pipe
cflags_com      +=
cxxflags_com    +=
ldflags_com     += -L$(prefix_path)/lib
libs_com        +=

include_path    := $(prefix_path)/include
lib_path        := $(prefix_path)/lib
pkg_config_path := $(lib_path)/pkgconfig

