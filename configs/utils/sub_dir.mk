# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    sub_dir.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/12 2019 15:11
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/12 2019      create the file
# 
#     last modified: 06/12 2019 15:11
# ===============================================================

TARGET_PATH 	?= $(PROJECT_DIR)/$(PROJECT_TARGET)
TARGET_DIR 		?= $(PROJECT_TARGET)-$(TARGET_VERSION)
TARGET_CONFIG   ?= $(TARGET_PATH)/$(BUILD_DIR)/$(TARGET_DIR)-config-ok
TAR_CMD 		?= tar -xzvf
TAR_SUFFIX 		?= tar.gz

