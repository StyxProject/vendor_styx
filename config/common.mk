#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
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

# Include our UI package
-include vendor/styx-ui/config.mk

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

# ThemePicker
PRODUCT_PACKAGES += \
    ThemePicker

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/styx/products/common/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/styx/products/common/bin/50-base.sh:system/addon.d/50-base.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/styx/products/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/styx/products/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/styx/products/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif
