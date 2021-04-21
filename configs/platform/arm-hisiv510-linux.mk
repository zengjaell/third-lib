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

TOOLCHAINS_DIR 		:= $(base_toolchains_path)/hisi-linux/$(PLATFORM)
TOOLCHAINS_BIN_DIR 	:= $(TOOLCHAINS_DIR)/bin
GCC_PREFIX 			:= $(PLATFORM)-
HOST         		:= arm-linux

CFLAGS 				:=
LDFLAGS 			:=

PREFIX_PATH 		:= $(base_prefix_path)/hisi-linux/$(PLATFORM)
