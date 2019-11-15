# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:18
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:18
# ===============================================================

include configs/com_var_def.mk
include configs/com_ruler_def.mk

makefile_list := $(wildcard ./project/*/Makefile)

all: 
ifdef project
	$(call run_dir_makefile_make_project, $(makefile_list), $(project))
else
	$(ECHO) "the instructions are as follows:"
	$(ECHO) ''
	$(ECHO) "\tmake list \t\t- show all projects that can be compiled."
	$(ECHO) ''
endif

include configs/com_target_def.mk

list:
	$(ECHO) "support compiled projects"
	$(call run_dir_makefile_make_list, $(makefile_list))

.PHONY: all list

