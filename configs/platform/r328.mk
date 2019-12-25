# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    r328.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 16:27
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 16:27
# ===============================================================

TOOLCHAINS_DIR 		:= /opt/toolchains/arm_328tina
TOOLCHAINS_BIN_DIR 	:= $(TOOLCHAINS_DIR)/bin
TOOLCHAINS_INC_DIR 	:= $(TOOLCHAINS_DIR)/include
GCC_PREFIX 			:= arm-openwrt-linux-
HOST         		:= arm-linux

CFLAGS 				:=
LDFLAGS 			:=

STAGING_DIR 		:= $(TOOLCHAINS_BIN_DIR)
export STAGING_DIR

