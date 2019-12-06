# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    utils.mk
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

# scale the maximum concurrency with the number of CPUs.
# # # An additional job is used in order to keep processors busy
# # # If the number of processors is not available, assume one.
PARALLEL_JOBS 	:= $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

HOSTMAKE  		:= $(shell which make || echo make)
MAKE1  			:= $(HOSTMAKE) -j1
MAKE 			:= $(HOSTMAKE) -j$(PARALLEL_JOBS)

define run_dir_makefile_make_target
	for dir in $(1); 			   		    	\
	do 									    	\
		$(MAKE1) -C $${dir%/*} $(2) || exit 1; 	\
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

