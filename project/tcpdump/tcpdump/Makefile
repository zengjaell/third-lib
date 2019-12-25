# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/12 2019 09:42
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/12 2019      create the file
# 
#     last modified: 25/12 2019 09:42
# ===============================================================

ifndef TOP_DIR
TOP_DIR := $(shell pwd)/../../..
endif

PROJECT_TARGET_TOP 		:= tcpdump
PROJECT_TARGET  		:= tcpdump
TARGET_VERSION 			:= 4.9.3
TARGET_DOWNLOAD_PATH 	:= https://www.tcpdump.org/release

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

TARGET_PATH 			:= $(PROJECT_DIR)/$(PROJECT_TARGET_TOP)/$(PROJECT_TARGET)
PREFIX_PATH 			:= $(TARGET_PATH)/../../$(INSTALL_DIR)
LIBPCAP_DIR        		:= $(PREFIX_PATH)/include/pcap

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(LIBPCAP_DIR), $(wildcard $(LIBPCAP_DIR)))
	$(ECHO) "\tuse \"make project=libpcap\" first to compile libpcap."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) \
		CFLAGS="-pipe -I$(PREFIX_PATH)/include" \
		LDFLAGS="-L$(PREFIX_PATH)/lib" \
		LIBS="-lpcap" \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

