# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 11:28
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 11:28
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET     		:= htop
TARGET_VERSION 			:= 2.2.0
TARGET_DOWNLOAD_PATH 	:= http://hisham.hm/htop/releases/$(TARGET_VERSION)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

NCURSES_DIR           	:= $(PREFIX_PATH)/include/ncurses
libncurses6_so 			:= $(PREFIX_PATH)/lib/libncurses6.so

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(NCURSES_DIR), $(wildcard $(NCURSES_DIR)))
	$(ECHO) "\tuse \"make project=ncurses\" first to  compile ncurses."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(libncurses6_so), $(wildcard $(libncurses6_so)))
	$(LN) $(PREFIX_PATH)/lib/libncurses.so.6.1 $(libncurses6_so)
endif
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && ./autogen.sh
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(RM) $(TARGET_PATH)/$(@:-config=)/config.h && \
		$(TARGET_PATH)/$(@:-config=)/configure \
		CC=$(GCC) CXX=$(CXX) \
		LDFLAGS="-L$(PREFIX_PATH)/lib" \
		CPPFLAGS="-I$(PREFIX_PATH)/include" \
		--program-prefix=$(PROGRAM_PREFIX) \
		--prefix=$(PREFIX_PATH) \
		--build=$(BUILD) \
        --host=$(HOST) \
        --disable-unicode

	$(TOUCH) $(TARGET_CONFIG)
endif

.PHONY: all clean distclean list

## 编译
#configure: error: missing libraries:  libncurses
#```
#ln -s libncurses.so.6.0 libncurses6.so
#```
#
### 运行
#
#### 缺少terminfo环境变量
#
#* 运行htop出现如下问题
#
#```
#  $ htop
#  Error opening terminal: vt102.
#  $
#```
#
#* 查看以下两个变量
#
#```
#  $ echo $TERM
#  $ echo $TERMINFO
#```
#
#* 增加环境变量
#
#```
#  $ vi /etc/profile
#  export TERM=vt102
#  export TERMINFO=/usr/share/terminfo
#```
#> note: 确保在/usr/share/terminfo/v/下，存在vt102这个文件

