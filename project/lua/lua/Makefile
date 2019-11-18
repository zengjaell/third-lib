# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:37
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:37
# ===============================================================

TO_TOP_DIR := ../../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= lua
TARGET_VERSION 			:= 5.1.5
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= http://www.lua.org/ftp
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz
PREFIX_PATH 			:= $(ROOT)/../../$(INSTALL_DIR)

TAB='\\t'

all: $(TARGET_DIR)-make

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(@:-make=) && $(MAKE) linux && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	sed -i 's/^#define LUA_USE_READLINE/\/\/#define LUA_USE_READLINE/g' \
		$(@:-config=)/src/luaconf.h
	sed -i '/\/usr\/local/i #define PREFIX_PATH \"$(ROOT)/../../$(INSTALL_DIR)/\"' $(@:-config=)/src/luaconf.h
	sed -i 's/\"\/usr\/local\/\"/PREFIX_PATH/g' $(@:-config=)/src/luaconf.h
	\
	awk '{sub(/\/usr\/local/, "$(PREFIX_PATH)"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
	sed -i 's/V/M/g' $(@:-config=)/Makefile
	sed -i 's/$$(MAKE) $$@/$$(MAKE) $$@ R=$$(R) VV=$$(VV)/g' $(@:-config=)/Makefile
	sed -i 's/^TO_LIB=/TO_LIB= liblua.so.$$(R)/g' $(@:-config=)/Makefile
	sed -i 's/$$(INSTALL_DATA) $$(TO_LIB)/$$(INSTALL_EXEC) $$(TO_LIB)/g' $(@:-config=)/Makefile
	sed -i '/$$(INSTALL_EXEC) $$(TO_LIB)/a ln -s lib$(TARGET).so.$(TARGET_VERSION) $$(INSTALL_LIB)/liblua.so.5' $(@:-config=)/Makefile
	sed -i '/$$(INSTALL_EXEC) $$(TO_LIB)/a ln -s liblua.so.5 $$(INSTALL_LIB)/liblua.so' $(@:-config=)/Makefile
	sed -i 's/^ln/$(TAB)&/g' $(@:-config=)/Makefile
	\
	awk '{sub("MYCFLAGS=-DLUA_USE_LINUX MYLIBS=\"-Wl,-E -ldl -lreadline -lhistory -lncurses\"", \
		"MYCFLAGS=\"-DLUA_USE_LINUX -fPIC\" MYLIBS=\"-Wl,-E -ldl\""); \
		print > "$(@:-config=)/src/Makefile"};' \
		$(@:-config=)/src/Makefile
	sed -i '/^LUA_A=/i LUA_SO= liblua.so' $(@:-config=)/src/Makefile
	sed -i 's/^ALL_T=/ALL_T= $$(LUA_SO)/g' $(@:-config=)/src/Makefile
	sed -i '/^$$(LUA_A)/i $$(LUA_SO): $$(CORE_O) $$(LIB_O)' $(@:-config=)/src/Makefile
	sed -i '/^$$(LUA_SO)/a $$(CC) -shared -Wl,-soname=$$@.$$(VV) -o $$@.$$(R) $$(CORE_O) $$(LIB_O)' $(@:-config=)/src/Makefile
	sed -i '/^$$(CC)/a ln -s $$@.$$(R) $$@.$$(VV)' $(@:-config=)/src/Makefile
	sed -i '/^ln/a ln -s $$@.$$(VV) $$@' $(@:-config=)/src/Makefile
	sed -i 's/^$$(CC)/$(TAB)&/g' $(@:-config=)/src/Makefile
	sed -i 's/^ln/$(TAB)&/g' $(@:-config=)/src/Makefile
ifeq ($(HOST)-x, $(BUILD)-x)
else
ifeq ($(HOST)-x, arm-linux-x)
	sed -i '/^CC=/i GCC_PRE := $(GCC_PATH)/$(GCC_PRE)' $(@:-config=)/src/Makefile
	sed -i 's/^CC= /CC= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
	sed -i 's/^AR= /AR= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
	sed -i 's/^RANLIB= /RANLIB= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
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
	$(ECHO) "\tmake project=lua \t\t- compile lua."

.PHONY: all clean distclean debug

