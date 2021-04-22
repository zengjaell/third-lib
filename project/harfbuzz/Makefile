# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    20/04 2021 16:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        20/04 2021      create the file
# 
#     last modified: 20/04 2021 16:23
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := harfbuzz
TARGET_VERSION 			:= 2.8.0
TARGET_DOWNLOAD_PATH 	:= https://archive.fastgit.org/harfbuzz/harfbuzz/archive/refs/tags/$(TARGET_VERSION).tar.gz

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: depend_lib $(TARGET_DIR)-make

ZLIB_FILE 		:= $(PREFIX_PATH)/include/zlib.h
PNG_FILE 		:= $(PREFIX_PATH)/include/png.h
freetype2_dir 	:= $(PREFIX_PATH)/include/freetype2
depend_lib:
ifneq ($(ZLIB_FILE), $(wildcard $(ZLIB_FILE)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(PNG_FILE), $(wildcard $(PNG_FILE)))
	$(ECHO) "\tuse \"make project=libpng \" first to compile png."
	$(ECHO) ''
	exit 1
endif
ifneq ($(freetype2_dir), $(wildcard $(freetype2_dir)))
	$(ECHO) "\tuse \"make project=freetype \" first to compile freetype."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-inside-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)

	cd $(TARGET_PATH)/$(@:-config=) && \
		./autogen.sh && \
		make distclean

	cd $(BUILD_DIR)/$(@:-config=) && \
		$(TARGET_PATH)/$(@:-config=)/configure \
			CC=$(GCC) CXX=$(CXX) \
			--with-glib=yes \
			--with-gobject=yes \
			--with-freetype=yes \
			--with-icu=no \
			LIBS="-lfreetype -lpng -lz" \
			CPPFLAGS="-I$(PREFIX_PATH)/include" \
			LDFLAGS="-L$(PREFIX_PATH)/lib" \
			PKG_CONFIG_PATH=$(PREFIX_PATH)/lib/pkgconfig \
			--prefix=$(PREFIX_PATH) \
			--build=$(BUILD) \
			--host=$(HOST) \
			--target=$(HOST)

	$(TOUCH) $(TARGET_CONFIG)
endif

$(TARGET_DIR)-inside-src:
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
	$(WGET) $(TARGET_DOWNLOAD_PATH) -O $(PROJECT_TARGET)-$(TARGET_VERSION).tar.gz
	$(TAR_CMD) $(@:-inside-src=).$(TAR_SUFFIX)
	$(RM) $(@:-inside-src=).$(TAR_SUFFIX)
endif

.PHONY: all clean distclean list

