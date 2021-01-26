# Kernel
include vendor/styx/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/styx/config/BoardConfigQcom.mk
endif

# Namespace for fwk-detect
TARGET_FWK_DETECT_PATH ?= hardware/qcom-caf/common
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_FWK_DETECT_PATH)/fwk-detect

# Soong
include vendor/styx/config/BoardConfigSoong.mk
