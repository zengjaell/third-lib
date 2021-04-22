# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    unione.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 17:33
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 17:33
# ===============================================================

toolchains_path 	:= /opt/toolchains/unione/arm-linux-hf-4.9
toolchains_bin_path := $(toolchains_path)/bin
gcc_prefix 			:= arm-linux-
host         		:= arm-linux

CFLAGS 				:=
LDFLAGS 			:=

prefix_path 		:= $(HOME)/data/install/unione
