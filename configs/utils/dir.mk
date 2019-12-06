# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    dir.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 17:49
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 17:49
# ===============================================================

CONFIGS_DIR 	:= $(TOP_DIR)/configs
PROJECT_DIR 	:= $(TOP_DIR)/project
PLATFROM_DIR   	:= $(CONFIGS_DIR)/platform
UTILS_DIR   	:= $(CONFIGS_DIR)/utils

BUILD_DIR   	:= build
INSTALL_DIR 	:= install
LIB_DIR 		:= lib
BIN_DIR 		:= bin
USR_BIN			:= /usr/bin/
USR_LIB 		:= /usr/lib/
USR_SHR 		:= /usr/share/

PREFIX_PATH 	:= $(PROJECT_DIR)/$(INSTALL_DIR)

