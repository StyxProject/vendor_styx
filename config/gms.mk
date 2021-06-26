ifneq ($(TARGET_NO_GAPPS), true)
$(warning GAPPS included. Set TARGET_NO_GAPPS to true for skipping GAPPS)
ifeq ($(TARGET_ARCH),arm64)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
else ifeq ($(TARGET_ARCH),arm)
$(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
else ifneq ($(filter x86 x86_64,$(TARGET_ARCH)),)
$(call inherit-product-if-exists, vendor/gapps/x86/x86-vendor.mk)
endif
endif
