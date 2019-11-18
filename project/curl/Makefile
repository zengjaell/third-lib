# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:19
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:19
# ===============================================================

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= curl
TARGET_VERSION 			:= 7.64.1
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= https://curl.haxx.se/download
TAR_CMD    	       		:= tar -xzvf
TAR_SUFFIX 	       		:= tar.gz
ZLIB_DIR           		:= ../install/include/zlib.h
OPENSSL_DIR        		:= ../install/include/openssl

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(ZLIB_DIR), $(wildcard $(ZLIB_DIR)))
	$(ECHO) "\tuse \"make project=zlib\" first to  compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(OPENSSL_DIR), $(wildcard $(OPENSSL_DIR)))
	$(ECHO) "\tuse \"make project=openssl\" first to compile openssl."
	$(ECHO) ''
	exit 1
endif

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(ROOT)/$(@:-config=)/configure CC=$(GCC) CXX=$(CXX) \
		--host=$(HOST) --with-zlib=$(PREFIX_PATH) --with-ssl=$(PREFIX_PATH) \
		--prefix=$(PREFIX_PATH)

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=curl \t\t- compile zlib."

.PHONY: all clean distclean list

