# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/04 2021 13:41
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/04 2021      create the file
# 
#     last modified: 21/04 2021 13:41
# ===============================================================

ifndef TOP_DIR
TOP_DIR 	:= $(shell pwd)/../..
endif

PROJECT_TARGET          := glib
TARGET_VERSION 			:= 2.68.1
TARGET_DOWNLOAD_PATH 	:= https://gitlab.gnome.org/GNOME/glib/-/archive/$(TARGET_VERSION)

CONFIGS_DIR := $(TOP_DIR)/configs

include $(CONFIGS_DIR)/common_var.mk
include $(UTILS_DIR)/sub_dir.mk

all: depend_lib $(TARGET_DIR)-inside-make

ZLIB_FILE 	:= $(PREFIX_PATH)/include/zlib.h
LIBFFI_FILE 	:= $(PREFIX_PATH)/include/ffi.h
depend_lib:
ifneq ($(ZLIB_FILE), $(wildcard $(ZLIB_FILE)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif
ifneq ($(LIBFFI_FILE), $(wildcard $(LIBFFI_FILE)))
	$(ECHO) "\tuse \"make project=libffi \" first to compile libffi."
	$(ECHO) ''
	exit 1
endif

include $(CONFIGS_DIR)/common_sub_target.mk

$(TARGET_DIR)-inside-make: $(TARGET_DIR)-config
	$(call echo-make-msg, $(@:-inside-make=))
	cd $(BUILD_DIR)/$(@:-inside-make=) && \
		ninja -j$(PARALLEL_JOBS) && \
		meson install

$(TARGET_DIR)-config: $(TARGET_DIR)-inside-src
ifneq ($(TARGET_CONFIG), $(wildcard $(TARGET_CONFIG)))
	$(MKDIR) $(BUILD_DIR)/$(@:-config=)

#		echo "pkgconfig         = '/usr/bin/pkg-config'" 			>> cross_file.txt && \
#		echo "sys_root          = '${PREFIX_PATH}'" 				>> cross_file.txt && \
#		echo "pkg_config_libdir = '${PREFIX_PATH}/lib/pkgconfig'" 	>> cross_file.txt &&

	cd $(BUILD_DIR)/$(@:-config=) && \
		echo "[binaries]" 										 	> cross_file.txt && \
		echo "c                 = '${CROSS_PREFIX}' + 'gcc'" 		>> cross_file.txt && \
		echo "cpp               = '${CROSS_PREFIX}' + 'g++'" 		>> cross_file.txt && \
		echo "ar                = '${CROSS_PREFIX}' + 'ar'" 		>> cross_file.txt && \
		echo "ld                = '${CROSS_PREFIX}' + 'ld'" 		>> cross_file.txt && \
		echo "strip             = '${CROSS_PREFIX}' + 'strip'" 		>> cross_file.txt && \
		\
		echo "" 													>> cross_file.txt && \
		echo "[properties]" 										>> cross_file.txt && \
		echo "c_args            = ['-I${PREFIX_PATH}/include']" 	>> cross_file.txt && \
		echo "c_link_args       = ['-L${PREFIX_PATH}/lib', '-lz', '-lffi']" >> cross_file.txt && \
		\
		echo "" 													>> cross_file.txt && \
		echo "[host_machine]" 										>> cross_file.txt && \
		echo "system            = 'linux'" 							>> cross_file.txt && \
		echo "cpu_family        = 'arm'" 							>> cross_file.txt && \
		echo "cpu               = 'armv7'" 							>> cross_file.txt && \
		echo "endian            = 'little'" 						>> cross_file.txt && \
		\
		echo "" 													>> cross_file.txt && \
		echo "[project options]" 									>> cross_file.txt && \
		echo "prefix            = '${PREFIX_PATH}'" 				>> cross_file.txt && \
		echo "internal_pcre     = 'true'" 							>> cross_file.txt && \
		echo "selinux           = 'disabled'" 						>> cross_file.txt && \
		echo "libelf            = 'disabled'" 						>> cross_file.txt

		cd $(TARGET_PATH)/$(@:-config=) && \
			sed -i "/^libffi_dep/a libffi_dep = dependency(\'libffi\', required : false)" meson.build && \
			sed -i "/'ffi_dep'])/d" meson.build && \
			meson \
			--prefix ${PREFIX_PATH} \
			--cross-file $(build_dir_path)/$(PROJECT_TARGET)-$(TARGET_VERSION)/cross_file.txt \
			$(build_dir_path)/$(PROJECT_TARGET)-$(TARGET_VERSION)

	$(TOUCH) $(TARGET_CONFIG)
endif

$(TARGET_DIR)-inside-src:
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
	$(WGET) $(TARGET_DOWNLOAD_PATH) -O $(PROJECT_TARGET)-$(TARGET_VERSION).tar.gz
	$(TAR_CMD) $(@:-inside-src=).$(TAR_SUFFIX)
	$(RM) $(@:-inside-src=).$(TAR_SUFFIX)
endif

.PHONY: all clean distclean list
