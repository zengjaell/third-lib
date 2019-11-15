# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:33
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:33
# ===============================================================

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= zlib
TARGET_VERSION 			:= 1.2.11
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= https://nchc.dl.sourceforge.net/project/libpng/zlib/$(TARGET_VERSION)
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz

all: $(TARGET_DIR)-make

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		export CC=$(CC) export CXX=$(CXX) && \
		$(ROOT)/$(@:-config=)/configure \
		--prefix=$(PREFIX_PATH)

	$(TOUCH) $(TARGET_CONFIG)
endif

list:
	$(ECHO) "\tmake project=zlib \t\t- compile zlib."

.PHONY: all clean distclean list

