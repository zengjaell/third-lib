# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:36
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:36
# ===============================================================

TO_TOP_DIR := ../../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= LuaBitOp
TARGET_VERSION 			:= 1.0.2
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= bitop.luajit.org/download
PREFIX_PATH 			:= $(ROOT)/../../$(INSTALL_DIR)
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz
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
	awk '{sub(/^LUA= lua/, "LUA= $(PREFIX_PATH)/bin/lua"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
	# sed -i 's/^LUA=/LUA=$(PREFIX_PATH)/g' $(@:-config=)/Makefile
ifeq ($(HOST)-x, $(BUILD)-x)
else
ifeq ($(HOST)-x, arm-linux-x)
	# sed -i '/^## Linux/a CC= $$(GCC_PRE)gcc' $(@:-config=)/Makefile
	# sed -i '/^## Linux/a GCC_PRE := $(GCC_PATH)/$(GCC_PRE)' $(@:-config=)/Makefile
endif
ifeq ($(HOST)-x, mips-linux-gnu-x)
endif
endif

	# $(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=lua-bitop \t\t- compile lua-bitop."

.PHONY: all clean distclean list

