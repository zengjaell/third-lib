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

$(target_dir)-strip-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-strip-make=))
	cd $(build_path)/$(@:-strip-make=) && $(make) && make install-strip

$(target_dir)-make: $(target_dir)-config
	$(call echo-make-msg, $(@:-inside-make=))
	cd $(build_path)/$(@:-make=) && $(make) && make install

# cd build/$(@:-make=) && $(make) VERBOSE=1 && make install

$(target_dir)-bz2-src:
ifneq ($(src_path)/$(target_dir), $(wildcard $(src_path)/$(target_dir)))
	cd $(src_path) && \
		$(WGET) $(target_download_path)/$(@:-bz2-src=).tar.bz2 && \
		$(TAR_BZ2) $(@:-bz2-src=).tar.bz2 && \
		$(RM) $(@:-bz2-src=).tar.bz2
endif

$(target_dir)-rename-bz2-src:
ifneq ($(src_path)/$(target_dir), $(wildcard $(src_path)/$(target_dir)))
	cd $(src_path) && \
		$(WGET) $(target_download_path) -O $(project_target)-$(target_version).tar.bz2 && \
		$(TAR_BZ2) $(@:-rename-bz2-src=).tar.bz2 && \
		$(RM) $(@:-rename-bz2-src=).tar.bz2
endif

$(target_dir)-gz-src:
ifneq ($(src_path)/$(target_dir), $(wildcard $(src_path)/$(target_dir)))
	cd $(src_path) && \
		$(WGET) $(target_download_path)/$(@:-gz-src=).tar.gz && \
		$(TAR_GZ) $(@:-gz-src=).tar.gz && \
		$(RM) $(@:-gz-src=).tar.gz
endif

$(target_dir)-rename-gz-src:
ifneq ($(src_path)/$(target_dir), $(wildcard $(src_path)/$(target_dir)))
	cd $(src_path) && \
		$(WGET) $(target_download_path) -O $(project_target)-$(target_version).tar.gz && \
		$(TAR_GZ) $(@:-rename-gz-src=).tar.gz && \
		$(RM) $(@:-rename-gz-src=).tar.gz
endif

clean:
	$(ECHO) "    rm build/$(target_dir)"
	$(RM) $(build_path)/$(target_dir)
	$(RM) $(config_ok_path)

distclean: clean
	$(ECHO) "    rm src/$(target_dir)"
	$(RM) $(target_dir)
	$(RM) $(target_dir).tar.gz*
	$(RM) $(target_dir).tar.bz2*

list:
ifneq ($(makefile_list), ) # 在顶层显示
	echo "$(project_target) / \c"
else # 在项目层显示
	$(ECHO) "\tmake \t\t\t- compile $(project_target)."
endif
