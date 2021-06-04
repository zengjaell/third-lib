# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    common_sub_target.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    06/12 2019 14:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        06/12 2019      create the file
# 
#     last modified: 06/12 2019 14:32
# ===============================================================

include $(top_dir)/configs/platform/platform_config.mk
include $(sub_target_path)/common_target.mk
include $(sub_target_path)/check_lib.mk

$(target_dir)-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make=))
	cd $(build_path)/$(@:-make=) && $(make) && make install

reconfig: $(target_dir)-rm-config_ok_path $(target_dir)-config

$(target_dir)-rm-config_ok_path:
	$(RM) $(config_ok_path)

$(target_dir)-bz2-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.bz2 && \
		$(WGET) $(target_download_path) && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_BZ2) $(@:-bz2-src=).tar.bz2
endif

$(target_dir)-rename-bz2-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.bz2 && \
		$(WGET) $(target_download_path) -O $(@:-rename-bz2-src=).tar.bz2 && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_BZ2) $(@:-rename-bz2-src=).tar.bz2
endif

$(target_dir)-gz-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.gz && \
		$(WGET) $(target_download_path) && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_GZ) $(@:-gz-src=).tar.gz
endif

$(target_dir)-rename-gz-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.gz && \
		$(WGET) $(target_download_path) -O $(@:-rename-gz-src=).tar.gz && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_GZ) $(@:-rename-gz-src=).tar.gz || \
		echo $$?
endif

$(target_dir)-xz-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.xz && \
		$(WGET) $(target_download_path) && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_XZ) $(@:-xz-src=).tar.xz
endif

$(target_dir)-rename-xz-src:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(target_tar_path), $(wildcard $(target_tar_path)))
	cd $(src_path) && \
		$(RM) $(@:-rename-gz-src=).tar.xz && \
		$(WGET) $(target_download_path) -O $(@:-rename-xz-src=).tar.xz && \
		touch $(target_tar_path)
endif
	cd $(src_path) && \
		$(TAR_XZ) $(@:-rename-xz-src=).tar.xz
endif

clean:
	$(ECHO) "    rm build/$(target_dir)"
	$(RM) $(build_path)/$(target_dir)
	$(RM) $(config_ok_path)

distclean: clean
	$(ECHO) "    rm src/$(target_dir)"
	$(RM) $(src_path)/$(target_dir)
	$(RM) $(src_path)/$(target_dir).tar.gz*
	$(RM) $(src_path)/$(target_dir).tar.bz2*

list:
ifneq ($(makefile_list), ) # 在顶层显示
	echo "$(project_target) / \c"
else # 在项目层显示
	$(ECHO) "\tmake \t\t\t- compile $(project_target)."
endif
