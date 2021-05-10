#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC
# Copyright (C) 2021 Styx Project.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from our versioning
$(call inherit-product, vendor/styx/config/versioning.mk)

# Inherit from our kernel/header generator
$(call inherit-product, vendor/styx/config/BoardConfigStyx.mk)

# Styx Boot Animation
PRODUCT_COPY_FILES += vendor/styx/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

# Styx Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/styx/overlay

DEVICE_PACKAGE_OVERLAYS += \
    vendor/styx/overlay

ifeq ($(TARGET_USES_QCOM_CHIPSET), true)
$(call inherit-product-if-exists, device/qcom/common/common.mk)

# QTI Permissions
PRODUCT_COPY_FILES += \
    vendor/styx/config/permissions/qcom/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/styx/config/permissions/qcom/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

TARGET_FS_CONFIG_GEN += vendor/styx/config/config.fs

endif

# Package definitions

ifeq ($(TARGET_USES_QCOM_CHIPSET), true)

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

endif

# TimeWeather
PRODUCT_PACKAGES += \
    TimeWeather

# Moto Live Wallpaper
PRODUCT_PACKAGES += \
    MotoLiveWallpaper3

# PulseMusic
PRODUCT_PACKAGES += \
    PulseMusic

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

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

ifneq ($(TARGET_NO_GAPPS), true)
$(call inherit-product-if-exists, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/pixel/config.mk)

# Don't preoptimize prebuilts when building GMS.
DONT_DEXPREOPT_PREBUILTS := true

endif

# Properties
include vendor/styx/config/properties.mk

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.build.selinux=1

# Dex optimization
USE_DEX2OAT_DEBUG := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

# Blurs
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/styx/products/common/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/styx/products/common/bin/50-base.sh:system/addon.d/50-base.sh

# System mount
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/bin/system-mount.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/system-mount.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/styx/products/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/styx/products/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Pixel APNs
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/telephony/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := false
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)
