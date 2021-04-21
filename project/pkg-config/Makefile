# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/04 2021 17:01
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/04 2021      create the file
# 
#     last modified: 21/04 2021 17:01
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := pkg-config
TARGET_VERSION 			:= 0.29.2
TARGET_DOWNLOAD_PATH 	:= https://pkgconfig.freedesktop.org/releases

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: $(TARGET_DIR)-make

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)

	# https://blog.csdn.net/hexf9632/article/details/102625696
	# 编译glib出现的问题，加了下面的echo语句和-C选项
	cd $(BUILD_DIR)/$(@:-config=) && \
		echo "glib_cv_stack_grows=yes" 			 > config.cache && \
		echo "ac_cv_func_posix_getpwuid_r=yes" 	>> config.cache && \
		echo "glib_cv_uscore=yes" 				>> config.cache && \
		echo "ac_cv_func_posix_getgrgid_r=yes" 	>> config.cache && \
		$(TARGET_PATH)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			-C \
			--with-internal-glib \
			--prefix=$(PREFIX_PATH) \
			--build=$(BUILD) \
			--host=$(HOST) \
			--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list
