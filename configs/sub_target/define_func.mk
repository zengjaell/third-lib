# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    define_func.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/12 2019 11:09
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/12 2019      create the file
# 
#     last modified: 06/12 2019 11:09
# ===============================================================

define run_dir_makefile_make_target
	for dir in $(1); do 			   		    	\
		$(make_j1) -C $${dir%/*} $(2) || exit 1; 	\
	done
endef

define run_dir_makefile_make_project
	for dir in $(1); do 			   		    	\
		path=$${dir%/*};  							\
		project=$${path##*/}; 						\
		if [ "$${project}" = ${2} ]; then 			\
			$(make_j1) -C $${path} || exit 1; 		\
		fi 											\
	done
endef
