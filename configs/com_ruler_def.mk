# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    com_ruler_def.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/11 2019 20:27
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/11 2019      create the file
# 
#     last modified: 14/11 2019 20:27
# ===============================================================
		
define run_dir_makefile_make_list
	for dir in $(1); 			   		    	\
	do 									    	\
		$(MAKE1) -C $${dir%/*} list || exit 1; 	\
	done
endef

define run_dir_makefile_make_project
	for dir in $(1); 			   		    	\
	do 									    	\
		path=$${dir%/*};  						\
		project=$${path##*/}; 					\
		if [ "$${project}" = ${2} ]; then 		\
			$(MAKE1) -C $${path} || exit 1; 	\
		fi 										\
	done
endef

