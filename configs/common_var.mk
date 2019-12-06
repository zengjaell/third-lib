# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    com_var_def.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    15/11 2019 11:21
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        15/11 2019      create the file
# 
#     last modified: 15/11 2019 11:21
# ===============================================================

# 配置需要编译的平台，如果没有指定，默认为x86_64
# 可选的平台有: x86_64, r328, rk3308, unione, x1830
PLATFORM := r328

ifndef $(UTILS_DIR)
UTILS_DIR := $(TOP_DIR)/configs/utils
endif

include $(UTILS_DIR)/dir.mk
include $(UTILS_DIR)/cmd.mk
include $(UTILS_DIR)/utils.mk

include $(PLATFROM_DIR)/platform_config.mk

