# Kernel
include vendor/stormbreaker/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/stormbreaker/config/BoardConfigQcom.mk
endif

# Soong
include vendor/stormbreaker/config/BoardConfigSoong.mk
