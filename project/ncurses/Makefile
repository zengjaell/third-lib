# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 14:23
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 14:23
# ===============================================================

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= ncurses
TARGET_VERSION 			:= 6.1
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= http://ftp.gnu.org/gnu/ncurses
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
		$(ROOT)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		CPPFLAGS="-pipe" \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=$(HOST) \
		--without-cxx \
		--without-cxx-binding \
		--without-ada \
		--without-manpages \
		--without-progs \
		--without-tests \
		--with-shared

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=ncurses \t\t- compile ncurses."

.PHONY: all clean distclean list

