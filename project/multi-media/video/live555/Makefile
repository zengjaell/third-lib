# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    18/11 2019 15:37
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        18/11 2019      create the file
# 
#     last modified: 18/11 2019 15:37
# ===============================================================

ifndef top_dir
top_dir := $(shell pwd)/../../../..
endif

project                 := live555
project_version         := latest
project_download_url    := http://www.livesw.com/liveMedia/public/live555-$(project_version).tar.gz

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: check_openssl

$(target_dir)-config: $(target_dir)-gz-src_inside
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
	$(MKDIR) $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&               \
        $(CP) $(src_path)/$(@:-config=)/* $(build_path)/$(@:-config=)

	cd $(build_path)/$(@:-config=) &&                                                       \
        sed -i 's#/usr/local#$(prefix_path)#g'                          config.armlinux &&  \
        sed -i 's#arm-elf-#$(cross_gcc)#g'                              config.armlinux &&  \
        sed -i 's#C_FLAGS =#C_FLAGS = -fPIC -DPIC#g'                    config.armlinux &&  \
        sed -i 's#CPLUSPLUS_FLAGS =#CPLUSPLUS_FLAGS = -fPIC -DPIC#g'    config.armlinux &&  \
        sed -i 's/-D_FILE_OFFSET_BITS=64/-D_FILE_OFFSET_BITS=64 -DALLOW_SERVER_PORT_REUSE/g' config.armlinux && \
        sed -i 's#ar cr#g++ -shared -o#g'                               config.armlinux &&  \
        sed -i 's/a$$/so/g'                                             config.armlinux &&  \
        sed -i 's#LINK_OPTS =#LINK_OPTS = -fPIC -DPIC#g'                config.armlinux &&  \
        sed -i 's#LIBS_FOR_CONSOLE_APPLICATION = -lssl -lcrypto#LIBS_FOR_CONSOLE_APPLICATION = -L$(lib_path) -lssl -lcrypto -lz#g' config.armlinux &&  \
        \
        ./genMakefiles armlinux && \
        \
        sed -i 's#/usr/local#$(prefix_path)#g'                          liveMedia/Makefile              &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          groupsock/Makefile              &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          UsageEnvironment/Makefile       &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          BasicUsageEnvironment/Makefile  &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          testProgs/Makefile              &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          mediaServer/Makefile            &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          proxyServer/Makefile            &&  \
        sed -i 's#/usr/local#$(prefix_path)#g'                          hlsProxy/Makefile

	$(TOUCH) $(config_ok_mark_path)
endif

$(target_dir)-gz-src_inside:
ifneq ($(target_dir_path), $(wildcard $(target_dir_path)))
ifneq ($(src_tar_mark_path), $(wildcard $(src_tar_mark_path)))
ifneq ($(src_mark_path).tar.gz, $(wildcard $(src_mark_path).tar.gz))
	cd $(src_path) && \
		$(RM) $(@:-gz-src_inside=).tar.gz && \
		$(WGET) $(project_download_url) \
			|| ! $(RM) $(@:-gz-src_inside=).tar.gz || exit 1
endif
		touch $(src_tar_mark_path)
endif
	cd $(src_path) && \
		$(MKDIR) $(@:-gz-src_inside=) && \
		$(TAR_GZ) $(@:-gz-src_inside=).tar.gz --strip-components 1 -C $(@:-gz-src_inside=)
endif

.PHONY: all clean distclean list

