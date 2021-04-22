# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    himix200.mk
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

TOOLCHAINS_DIR 		:= /opt/toolchains/hisi-linux/$(PLATFORM)
TOOLCHAINS_BIN_DIR 	:= $(TOOLCHAINS_DIR)/bin
GCC_PREFIX 			:= $(PLATFORM)-
program_prefix 		:= $(PLATFORM)-
HOST         		:= $(PLATFORM)

CFLAGS 				:=
LDFLAGS 			:=

PREFIX_PATH 		:= $(HOME)/data/install/hisi-linux/$(PLATFORM)
