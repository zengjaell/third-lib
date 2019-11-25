# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:07
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:07
# ===============================================================

TO_TOP_DIR := ../../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= gdb
TARGET_VERSION 			:= 8.2.1
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= http://ftp.gnu.org/gnu/gdb
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz
PREFIX_PATH 			:= $(ROOT)/../../$(INSTALL_DIR)

all: $(TARGET_DIR)-make

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

# --enable-shared    			动态编译
# --without-x     				取消x windows 支持
# --disable-gdbtk  				取消gdbtk,应该也是图形界面相关的
# --disable-tui   				取消tui 界面
# --without-included-regex 		关闭正则表达式库
# --without-included-gettext  	去掉用于多语言处理的 gettext库
# CPPFLAGS/LDFLAGS				确保能找到ARM版的ncurses库

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(ROOT)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) AR=$(AR) LD=$(LD) \
		LDFLAGS="-L$(PREFIX_PATH)/lib" \
		CPPFLAGS="-I$(PREFIX_PATH)/include -pipe" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--target=$(HOST)

	cp ./remote.c $(ROOT)/$(@:-config=)/gdb/remote.c

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=gdb \t\t- compile gdb."

.PHONY: all clean distclean list

