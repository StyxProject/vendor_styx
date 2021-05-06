# Fingerprint
ifeq ($(TARGET_BUILD_VARIANT),user)
BUILD_FINGERPRINT ?= google/redfin/redfin:11/RQ2A.210505.003/7255357:user/release-keys
endif

# Gestures
ifneq ($(TARGET_USES_HARDWARE_KEYS),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural
endif

# ADB
ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable ADB authentication.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
# Disable ADB authentication.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true

# Storage Manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true
