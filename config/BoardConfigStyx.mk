# Kernel
include vendor/styx/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
	include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

# Soong
include vendor/styx/config/BoardConfigSoong.mk
