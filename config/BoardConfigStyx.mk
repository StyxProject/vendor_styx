# Kernel
include vendor/styx/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/styx/config/BoardConfigQcom.mk
endif

# Soong
include vendor/styx/config/BoardConfigSoong.mk
