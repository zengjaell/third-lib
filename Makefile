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

top_dir         := $(shell pwd)
makefile_list   := $(wildcard ./project/*/Makefile)
makefile_list   += $(wildcard ./project/*/*/Makefile)
makefile_list   += $(wildcard ./project/*/*/*/Makefile)

export top_dir
export makefile_list

include $(top_dir)/configs/common_var.mk

all:
ifdef lib
	$(call run_dir_makefile_make_project, $(makefile_list), $(lib))
else
	$(ECHO) "the instructions are as follows:"
	$(ECHO) ''
	$(ECHO) "\tmake test  \t\t- test gcc is working."
	$(ECHO) "\tmake list  \t\t- show all projects that can be compiled."
	$(ECHO) "\tmake clean \t\t- clean all build projects."
	$(ECHO) "\tmake distclean\t\t- clean all projects."
	$(ECHO) ''
endif

include $(sub_target_path)/define_func.mk
include $(sub_target_path)/common_target.mk
include $(top_dir)/configs/vender/platform_config.mk

test:
	$(ECHO) "gcc path: "
	$(ECHO) "    $(CC)"
	$(ECHO) ""
	$(ECHO) "gcc version: "
	$(CC) --version

list:
	$(ECHO) "support compiled projects: "
	$(ECHO) ""
	$(call run_dir_makefile_make_target, $(makefile_list), list)
	$(ECHO) ""
	$(ECHO) ""
	$(ECHO) "\teg: make lib=zlib           - compile zlib"
	$(ECHO) "\teg: make lib=htop           - compile htop"
	$(ECHO) ""
	$(ECHO) "\teg: make lib=zlib V=1       - compile zlib with verbose info"
	$(ECHO) "\teg: make lib=zlib_clean     - clean zlib with build(./build/zlib-x.x.x) dir"
	$(ECHO) "\teg: make lib=zlib_distcelan - clean zlib with build(./build/zlib/-x.x.x) and src(./src/zlib-x.x.x) dir"
	$(ECHO) ""

clean:
	$(ECHO) "clean all build projects"
	$(RM) $(prefix_path)
	$(call run_dir_makefile_make_target, $(makefile_list), clean)

clean-src:
	$(ECHO) "clean all src projects"
	$(RM) $(prefix_path)
	$(call run_dir_makefile_make_target, $(makefile_list), clean-src)

distclean:
	$(ECHO) "clean all projects"
	$(RM) $(prefix_path)
	$(call run_dir_makefile_make_target, $(makefile_list), distclean)

debug:
	echo $(makefile_list)

.PHONY: all list

