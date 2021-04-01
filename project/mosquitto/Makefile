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

PROJECT_TARGET 			:= mosquitto
TARGET_VERSION 			:= 2.0.9
TARGET_DOWNLOAD_PATH 	:= https://github.com/eclipse/mosquitto/archive/refs/tags/v$(TARGET_VERSION).tar.gz
GITHUB_FLAG 			:= yes

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

CARES_FILE           	:= $(PREFIX_PATH)/include/ares.h
NCURSES_DIR           	:= $(PREFIX_PATH)/include/openssl
CJSON_DIR           	:= $(PREFIX_PATH)/include/cjson
LIBWEBSOCKETS_DIR       := $(PREFIX_PATH)/include/libwebsockets

all: depend_lib install_depend $(TARGET_DIR)-make_inside

depend_lib:
ifneq ($(NCURSES_DIR), $(wildcard $(NCURSES_DIR)))
	$(ECHO) "\tuse \"make project=openssl \" first to compile openssl."
	$(ECHO) ''
	exit 1
endif
ifneq ($(LIBWEBSOCKETS_DIR), $(wildcard $(LIBWEBSOCKETS_DIR)))
	$(ECHO) "\tuse \"make project=libwebsockets \" first to compile libwebsockets."
	$(ECHO) ''
	exit 1
endif
ifneq ($(CARES_FILE), $(wildcard $(CARES_FILE)))
	$(ECHO) "\tuse \"make project=c-ares-cares \" first to compile c-ares-cares."
	$(ECHO) ''
	exit 1
endif
ifneq ($(CJSON_DIR), $(wildcard $(CJSON_DIR)))
	$(ECHO) "\tuse \"make project=cJSON \" first to compile cJSON."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

install_depend:
	$(ECHO) "$(PREFIX_PATH)/lib"
	$(MKDIR) "$(PREFIX_PATH)/lib"

$(TARGET_DIR)-make_inside: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make_inside=))
	cd $(BUILD_DIR)/$(@:-make_inside=) && \
		export CC=gcc \
		export CROSS_COMPILE=$(CROSS_PREFIX) \
		export CPPFLAGS=-I$(PREFIX_PATH)/include \
		export LDFLAGS="-L$(PREFIX_PATH)/lib -lssl -lcrypto -lcares" \
		export prefix=$(PREFIX_PATH) && \
		$(MAKE) && make uninstall && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(CP) ../../$(@:-config=)/* ./

	sed -i 's/WITH_SRV:=no/WITH_SRV:=yes/' $(BUILD_DIR)/$(@:-config=)/config.mk
	sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' $(BUILD_DIR)/$(@:-config=)/config.mk

	sed -i 's/{DESTDIR}\/etc\/mosquitto/{prefix}\/etc\/mosquitto/g' $(BUILD_DIR)/$(@:-config=)/Makefile

	exit
	
	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list install_depend

