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

TO_top_dir := ../../..

include $(TO_top_dir)/configs/com_var_def.mk

target           		:= LuaBitOp
project_version 			:= 1.0.2
target_dir 				:= $(target)-$(project_version)
config_ok_mark_path    		:= $(build_DIR)/$(target_dir)-config-ok
project_download_url 	:= bitop.luajit.org/download
prefix_path 			:= $(ROOT)/../../$(INSTALL_DIR)
LUA_DIR 	       		:= ../../install/include/lua.h

all: depend_lib $(target_dir)-make

depend_lib:
ifneq ($(LUA_DIR), $(wildcard $(LUA_DIR)))
	$(ECHO) "\tuse \"make project=lua\" first to  compile lua."
	$(ECHO) ''
	exit 1
endif

include $(TO_top_dir)/configs/com_target_def.mk

$(target_dir)-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(@:-make=) && $(make) && make install

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_DIR)/$(@:-config=)
	awk '{sub(/\/usr\/local/, "$(prefix_path)"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
	awk '{sub(/^LUA= lua/, "LUA= $(prefix_path)/bin/lua"); \
		print > "$(@:-config=)/Makefile"};' \
		$(@:-config=)/Makefile
	# sed -i 's/^LUA=/LUA=$(prefix_path)/g' $(@:-config=)/Makefile
ifeq ($(host)-x, $(build)-x)
else
ifeq ($(host)-x, arm-linux-x)
	# sed -i '/^## Linux/a CC= $$(GCC_PRE)gcc' $(@:-config=)/Makefile
	# sed -i '/^## Linux/a GCC_PRE := $(GCC_PATH)/$(GCC_PRE)' $(@:-config=)/Makefile
endif
ifeq ($(host)-x, mips-linux-gnu-x)
endif
endif

	# $(TOUCH) $(config_ok_mark_path)
endif

clean:
	$(RM) $(build_DIR)

distclean: clean
	$(RM) $(target_dir)

list:
	$(ECHO) "\tmake project=lua-bitop \t\t- compile lua-bitop."

.PHONY: all clean distclean list

