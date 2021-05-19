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

top_dir := $(shell pwd)
export top_dir

include $(top_dir)/configs/common_var.mk

# makefile_list := $(wildcard ./project/zlib/Makefile)
makefile_list := $(wildcard ./project/*/Makefile)
export makefile_list

all:
ifdef project
	$(call run_dir_makefile_make_project, $(makefile_list), $(project))
else
	$(ECHO) "the instructions are as follows:"
	$(ECHO) ''
	$(ECHO) "\tmake help  \t\t- help info."
	$(ECHO) "\tmake list  \t\t- show all projects that can be compiled."
	$(ECHO) "\tmake clean \t\t- clean all build projects."
	$(ECHO) "\tmake distclean\t\t- clean all projects."
	$(ECHO) ''
endif

include $(sub_target_path)/define_func.mk
include $(sub_target_path)/common_target.mk

help:
	$(ECHO) "help info: "
	$(ECHO) ""
	$(ECHO) "\teg: make project=htop           - compile htop"
	$(ECHO) "\teg: make project=zlib           - compile zlib"
	$(ECHO) ""
	$(ECHO) "\teg: make project=zlib V=1       - compile zlib with verbose info"
	$(ECHO) "\teg: make project=zlib_clean     - clean zlib with build(./build/zlib-x.x.x) dir"
	$(ECHO) "\teg: make project=zlib_distclan  - clean zlib with build(./build/zlib/-x.x.x) and src(./src/zlib-x.x.x) dir"
	$(ECHO) ""

list:
	$(ECHO) "support compiled projects: "
	$(ECHO) ""
	$(call run_dir_makefile_make_target, $(makefile_list), list)
	$(ECHO) ""
	$(ECHO) ""
	$(ECHO) "\teg: make project=zlib           - compile zlib"
	$(ECHO) "\teg: make project=htop           - compile htop"
	$(ECHO) ""

clean:
	$(ECHO) "clean all build projects"
	$(RM) $(prefix_path)
	$(call run_dir_makefile_make_target, $(makefile_list), clean)

distclean:
	$(ECHO) "clean all projects"
	$(RM) $(prefix_path)
	$(call run_dir_makefile_make_target, $(makefile_list), distclean)

debug:
	echo $(makefile_list)

.PHONY: all list

