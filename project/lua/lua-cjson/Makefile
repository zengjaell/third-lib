# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:34
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:34
# ===============================================================

TO_TOP_DIR := ../../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= lua-cjson
TARGET_VERSION 			:= 2.1.0
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= https://www.kyne.com.au/~mark/software/download
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz
PREFIX_PATH 			:= $(ROOT)/../../$(INSTALL_DIR)
LUA_DIR 	       		:= ../../install/include/lua.h

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(LUA_DIR), $(wildcard $(LUA_DIR)))
	$(ECHO) "\tuse \"make project=lua\" first to  compile lua."
	$(ECHO) ''
	exit 1
endif

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	awk '{sub(/\/usr\/local/, "$(PREFIX_PATH)"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
ifeq ($(HOST)-x, $(BUILD)-x)
else
ifeq ($(HOST)-x, arm-linux-x)
	sed -i '/^## Linux/a CC= $$(GCC_PRE)gcc' $(@:-config=)/Makefile
	sed -i '/^## Linux/a GCC_PRE := $(GCC_PATH)/$(GCC_PRE)' $(@:-config=)/Makefile
endif
ifeq ($(HOST)-x, mips-linux-gnu-x)
endif
endif

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=lua-cjson \t\t- compile lua-cjson."

.PHONY: all clean distclean list

