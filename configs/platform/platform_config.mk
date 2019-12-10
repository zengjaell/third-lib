# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    platform_config.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/12 2019 16:40
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/12 2019      create the file
# 
#     last modified: 05/12 2019 16:40
# ===============================================================

# 配置需要编译的平台
# 可选的平台有: x86_64, r328, rk3308, unione, x1830
PLATFORM := r328

# build为编译的平台，host为运行的平台，target为调试的平台
#
# --host=i686-pc-linux-gnu  指定了生成<可执行文件>运行的平台和系统，运行于X86平台的linux系统
# --host=arm-linux 			指定了生成<可执行文件>运行的平台和系统，运行于ARM平台的linux系统
# --target=arm-linux 		目标平台是运行于ARM体系结构的linux内核
BUILD := x86_64-linux-gnu

ifeq ($(PLATFORM), x86_64)
  include $(PLATFROM_DIR)/x86_64.mk
else ifeq ($(PLATFORM), unione)
  include $(PLATFROM_DIR)/unione.mk
else ifeq ($(PLATFORM), x1830)
  include $(PLATFROM_DIR)/x1830.mk
else ifeq ($(PLATFORM), rk3308)
  include $(PLATFROM_DIR)/rk3308.mk
else ifeq ($(PLATFORM), r328)
  include $(PLATFROM_DIR)/r328.mk
endif

TARGET 			:= $(HOST)
PROGRAM_PREFIX 	:= $(PLATFORM)-

ifneq ($(PLATFORM), x86_64)
CROSS_PREFIX 	:= $(TOOLCHAINS_BIN_DIR)/$(GCC_PREFIX)
endif

AR 	    		:= $(CROSS_PREFIX)ar
AS 	    		:= $(CROSS_PREFIX)as
LD 	    		:= $(CROSS_PREFIX)ld
NM 	    		:= $(CROSS_PREFIX)nm
CC 	    		:= $(CROSS_PREFIX)gcc
GCC     		:= $(CROSS_PREFIX)gcc
CPP     		:= $(CROSS_PREFIX)cpp
CXX     		:= $(CROSS_PREFIX)g++
FC      		:= $(CROSS_PREFIX)gfortran
F77     		:= $(CROSS_PREFIX)gfortran
RANLIB  		:= $(CROSS_PREFIX)ranlib
READELF 		:= $(CROSS_PREFIX)readelf
STRIP   		:= $(CROSS_PREFIX)strip
OBJCOPY 		:= $(CROSS_PREFIX)objcopy
OBJDUMP 		:= $(CROSS_PREFIX)objdump

