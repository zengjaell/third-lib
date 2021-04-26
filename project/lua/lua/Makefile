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

TO_top_dir := ../../..

include $(TO_top_dir)/configs/com_var_def.mk

target           		:= lua
target_version 			:= 5.1.5
target_dir 				:= $(target)-$(target_version)
config_ok_path    		:= $(build_DIR)/$(target_dir)-config-ok
target_download_path 	:= http://www.lua.org/ftp
prefix_path 			:= $(ROOT)/../../$(INSTALL_DIR)

TAB='\\t'

all: $(target_dir)-make

include $(TO_top_dir)/configs/com_target_def.mk

$(target_dir)-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(@:-make=) && $(make) linux && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
	$(MKDIR) $(build_DIR)/$(@:-config=)
	sed -i 's/^#define LUA_USE_READLINE/\/\/#define LUA_USE_READLINE/g' \
		$(@:-config=)/src/luaconf.h
	sed -i '/\/usr\/local/i #define prefix_path \"$(ROOT)/../../$(INSTALL_DIR)/\"' $(@:-config=)/src/luaconf.h
	sed -i 's/\"\/usr\/local\/\"/prefix_path/g' $(@:-config=)/src/luaconf.h
	\
	awk '{sub(/\/usr\/local/, "$(prefix_path)"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
	sed -i 's/V/M/g' $(@:-config=)/Makefile
	sed -i 's/$$(make) $$@/$$(make) $$@ R=$$(R) VV=$$(VV)/g' $(@:-config=)/Makefile
	sed -i 's/^TO_LIB=/TO_LIB= liblua.so.$$(R)/g' $(@:-config=)/Makefile
	sed -i 's/$$(INSTALL_DATA) $$(TO_LIB)/$$(INSTALL_EXEC) $$(TO_LIB)/g' $(@:-config=)/Makefile
	sed -i '/$$(INSTALL_EXEC) $$(TO_LIB)/a ln -s lib$(target).so.$(target_version) $$(INSTALL_LIB)/liblua.so.5' $(@:-config=)/Makefile
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
ifeq ($(host)-x, $(build)-x)
else
ifeq ($(host)-x, arm-linux-x)
	sed -i '/^CC=/i GCC_PRE := $(GCC_PATH)/$(GCC_PRE)' $(@:-config=)/src/Makefile
	sed -i 's/^CC= /CC= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
	sed -i 's/^AR= /AR= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
	sed -i 's/^RANLIB= /RANLIB= $$(GCC_PRE)/g' $(@:-config=)/src/Makefile
endif
ifeq ($(host)-x, mips-linux-gnu-x)
endif
endif

	$(TOUCH) $(config_ok_path)
endif

clean:
	$(RM) $(build_DIR)

distclean: clean
	$(RM) $(target_dir)

list:
	$(ECHO) "\tmake project=lua \t\t- compile lua."

.PHONY: all clean distclean debug

