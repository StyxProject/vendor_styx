#
# Copyright (C) 2021 The Styx Project
#

# Package definitions

ifeq ($(TARGET_USES_QCOM_CHIPSET), true)

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

endif

# PulseMusic
PRODUCT_PACKAGES += \
    PulseMusic

# IORAP
PRODUCT_PACKAGES += iorap-nall

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# ThemePicker
PRODUCT_PACKAGES += \
    ThemePicker
