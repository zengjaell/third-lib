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
PARALLEL_JOBS   := $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

hostmake        := $(shell which make || echo make)
make            := $(hostmake) -j$(PARALLEL_JOBS)
make_j1         := $(hostmake)

sub_target_path := $(top_dir)/configs/sub_target
project_path    := $(top_dir)/project
src_path        := $(top_dir)/src
build_path      := $(top_dir)/build

include $(top_dir)/configs/utils/cmd.mk

target_dir      ?= $(project_target)-$(target_version)
target_dir_path := $(src_path)/$(target_dir)
config_ok_path  ?= $(build_path)/.$(target_dir)-config-ok

