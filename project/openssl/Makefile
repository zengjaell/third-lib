# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 10:15
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 10:15
# ===============================================================

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= openssl
TARGET_VERSION 			:= 1.1.0g
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= https://www.openssl.org/source
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz

all: $(TARGET_DIR)-make

include $(TO_TOP_DIR)/configs/com_target_def.mk

ifeq ($(HOST)-x, $(BUILD)-x)
	CONFIG_CONTENT := linux-x86_64
else
ifeq ($(HOST)-x, arm-linux-x)
	CONFIG_CONTENT := linux-armv4 no-asm \
		--cross-compile-prefix=$(GCC_TYPE)
endif
ifeq ($(HOST)-x, mips-linux-gnu-x)
endif
endif

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(ROOT)/$(@:-config=)/Configure \
		$(CONFIG_CONTENT) \
		--prefix=$(PREFIX_PATH)

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=openssl \t\t- compile openssl."

.PHONY: all clean distclean list

