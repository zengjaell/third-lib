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

TO_TOP_DIR := ../..

include $(TO_TOP_DIR)/configs/com_var_def.mk

TARGET           		:= htop
TARGET_VERSION 			:= 2.2.0
TARGET_DIR 				:= $(TARGET)-$(TARGET_VERSION)
TARGET_CONFIG    		:= $(BUILD_DIR)/$(TARGET_DIR)-config-ok
TARGET_DOWNLOAD_PATH 	:= http://hisham.hm/htop/releases/$(TARGET_VERSION)
TAR_CMD 				:= tar -xzvf
TAR_SUFFIX 				:= tar.gz
NCURSES_DIR           	:= $(PREFIX_PATH)/include/ncurses
libncurses6_so 			:= $(PREFIX_PATH)/lib/libncurses6.so

all: depend_lib $(TARGET_DIR)-make

depend_lib:
ifneq ($(NCURSES_DIR), $(wildcard $(NCURSES_DIR)))
	$(ECHO) "\tuse \"make project=ncurses\" first to  compile ncurses."
	$(ECHO) ''
	exit 1
endif

include $(TO_TOP_DIR)/configs/com_target_def.mk

$(TARGET_DIR)-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-make=))
	cd $(BUILD_DIR)/$(@:-make=) && $(MAKE) && make install

$(TARGET_DIR)-config: $(TARGET_DIR)-src
ifneq ($(libncurses6_so), $(wildcard $(libncurses6_so)))
	$(LN) $(PREFIX_PATH)/lib/libncurses.so.6.1 $(libncurses6_so)
endif
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)
	cd $(@:-config=) && ./autogen.sh
	cd $(BUILD_DIR)/$(@:-config=) && \
		$(RM) $(ROOT)/$(@:-config=)/config.h && \
		$(ROOT)/$(@:-config=)/configure \
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

clean:
	$(RM) $(BUILD_DIR)

distclean: clean
	$(RM) $(TARGET_DIR)

list:
	$(ECHO) "\tmake project=htop \t\t- compile htop."

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

