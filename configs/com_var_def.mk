# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    com_var_def.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    15/11 2019 11:21
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        15/11 2019      create the file
# 
#     last modified: 15/11 2019 11:21
# ===============================================================

# scale the maximum concurrency with the number of CPUs.
# # # An additional job is used in order to keep processors busy
# # # If the number of processors is not available, assume one.
PARALLEL_JOBS 	:= $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

HOSTMAKE  		:= $(shell which make || echo make)
MAKE1  			:= $(HOSTMAKE) -j1
MAKE 			:= $(HOSTMAKE) -j$(PARALLEL_JOBS)

TOP_DIR 		:= $(shell pwd)
BUILD_DIR   	:= build
INSTALL_DIR 	:= install
CONFIGS_DIR 	:= configs
LIB_DIR 		:= lib
BIN_DIR 		:= bin
USR_BIN			:= /usr/bin/
USR_LIB 		:= /usr/lib/
USR_SHR 		:= /usr/share/

ROOT  			:= $(shell pwd)
PREFIX_PATH 	:= $(ROOT)/../$(INSTALL_DIR)

export TOP_DIR

MKDIR 			:= mkdir -p
RM 				:= rm -rf
CP 				:= cp -ar
TOUCH   		:= touch
ECHO 			:= echo
WGET   			:= wget
LN 				:= ln -sf

GIT_CLONE  		:= git clone
GIT_CO 	   		:= git checkout -b

ADB_PUSH   		:= adb push
ADB_SHELL  		:= adb shell

BUILD  			:= x86_64-linux-gnu

TARGET_SYSTEM   := pc
# TARGET_SYSTEM   := unisound
# TARGET_SYSTEM   := x1800

ifeq ($(TARGET_SYSTEM)-x, pc-x)
	HOST 		:= $(BUILD)
else
ifeq ($(TARGET_SYSTEM)-x, x1800-x)
	GCC_PATH 	 	:= /home/uos/test/ingenic/mips-gcc520-32bit/bin
	GCC_PRE 	 	:= mips-linux-gnu-
	HOST         	:= mips-linux-gnu
	PROGRAM_PREFIX 	:= mipsel-linux-
	GCC_TYPE 		:= $(GCC_PATH)/$(GCC_PRE)
endif
ifeq ($(TARGET_SYSTEM)-x, unisound-x)
	GCC_PATH 	 	:= /home/uos/yzs/tool-chain/arm-linux-hf-4.9/unione/arm-linux-hf-4.9/bin
	GCC_PRE 	 	:= arm-linux-
	HOST         	:= arm-linux
	PROGRAM_PREFIX 	:= arm-linux-
	GCC_TYPE 		:= $(GCC_PATH)/$(GCC_PRE)
endif
endif

AR 	   := $(GCC_TYPE)ar
AS 	   := $(GCC_TYPE)as
LD 	   := $(GCC_TYPE)ld
NM 	   := $(GCC_TYPE)nm
CC 	   := $(GCC_TYPE)gcc
GCC     := $(GCC_TYPE)gcc
CPP     := $(GCC_TYPE)cpp
CXX     := $(GCC_TYPE)g++
FC      := $(GCC_TYPE)gfortran
F77     := $(GCC_TYPE)gfortran
RANLIB  := $(GCC_TYPE)ranlib
READELF := $(GCC_TYPE)readelf
STRIP   := $(GCC_TYPE)strip
OBJCOPY := $(GCC_TYPE)objcopy
OBJDUMP := $(GCC_TYPE)objdump

