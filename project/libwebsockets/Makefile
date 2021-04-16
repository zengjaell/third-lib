# ===============================================================
# 
# Release under GPL-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    23/03 2021 11:29
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        23/03 2021      create the file
# 
#     last modified: 23/03 2021 11:29
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET 			:= libwebsockets
TARGET_VERSION 			:= 4.1.6
TARGET_DOWNLOAD_PATH 	:= https://codeload.github.com/warmcat/libwebsockets/tar.gz/refs/tags/v$(TARGET_VERSION)
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: depend_lib install_depend $(TARGET_DIR)-make

ZLIB_FILE 	:= $(PREFIX_PATH)/include/zlib.h
NCURSES_DIR := $(PREFIX_PATH)/include/openssl
depend_lib:
ifneq ($(ZLIB_FILE), $(wildcard $(ZLIB_FILE)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(NCURSES_DIR), $(wildcard $(NCURSES_DIR)))
	$(ECHO) "\tuse \"make project=openssl \" first to  compile openssl."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

install_depend:
	$(ECHO) "$(PREFIX_PATH)/lib"
	$(MKDIR) "$(PREFIX_PATH)/lib"

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		cmake \
		../../$(@:-config=) \
		-DCMAKE_INSTALL_PREFIX=$(PREFIX_PATH) \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_C_COMPILER=$(CC) \
		-DCMAKE_CXX_COMPILER=$(CXX) \
		\
		-DLWS_WITH_ZLIB=1 \
		-DLWS_ZLIB_INCLUDE_DIRS=$(PREFIX_PATH)/include \
		-DLWS_ZLIB_LIBRARIES="$(PREFIX_PATH)/lib/libz.so" \
		\
		-DLWS_WITH_HTTP2=1 \
		-DLWS_OPENSSL_INCLUDE_DIRS=$(PREFIX_PATH)/include \
		-DLWS_OPENSSL_LIBRARIES="$(PREFIX_PATH)/lib/libssl.so;$(PREFIX_PATH)/lib/libcrypto.so;"

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list install_depend

