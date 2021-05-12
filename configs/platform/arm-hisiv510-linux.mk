# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    hisiv510.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    23/03 2021 11:04
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        23/03 2021      create the file
# 
#     last modified: 23/03 2021 11:04
# ===============================================================

toolchains_path 	:= $(base_toolchains_path)/hisi-linux/$(platform)
toolchains_bin_path := $(toolchains_path)/bin
gcc_prefix 			:= $(platform)-
program_prefix 		:= $(platform)-
host         		:= $(platform)

CFLAGS 				:=
LDFLAGS 			:=

prefix_path 		?= $(base_prefix_path)/hisi-linux/$(platform)
