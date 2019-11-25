# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:40
# ===============================================================

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= valgrind
TARGET_VERSION 			:= 3.14.0
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= http://www.valgrind.org/downloads
TAR_CMD 				:= tar -xjvf
TAR_SUFFIX 				:= tar.bz2

all: $(TARGET_DIR)-make

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && ./autogen.sh
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(ROOT)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
		--host=armv7-linux

# 注意：只支持 armV7、armV8两种arm CPU架构。
# 
# 注意：特别注意安装目录，否则出现如下错误：
# “valgrind: failed to start tool 'memcheck' for platform 'arm-linux': No such file or directory”
# 增加目录路径：
# 	export VALGRIND_LIB=/lib/valgrind

	$(TOUCH) $(TARGET_CONFIG)
endif

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=valgrind \t\t- compile valgrind."

.PHONY: all clean distclean debug

