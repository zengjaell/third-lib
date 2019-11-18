# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    com_target_def.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    15/11 2019 13:47
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        15/11 2019      create the file
# 
#     last modified: 15/11 2019 13:47
# ===============================================================

$(TARGET_DIR)-src:
ifneq ($(TARGET_DIR), $(wildcard $(TARGET_DIR)))
	$(call echo-download-msg, $(@:-src=))
	$(WGET) $(TARGET_DOWNLOAD_PATH)/$(@:-src=).$(TAR_SUFFIX)
	$(TAR_CMD) $(@:-src=).$(TAR_SUFFIX)
	$(RM) $(@:-src=).$(TAR_SUFFIX)
endif

#########################################################
err_no_targets:
	@echo "error: use \"targets = your_target\" to specify your target to make!"
	exit 1

ifeq ($(V),1)
slient_targets=err_no_targets
endif

.SILENT: $(slient_targets)

