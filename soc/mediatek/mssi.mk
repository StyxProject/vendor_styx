#
# Copyright (C) 2021 The Styx Project
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

SOC_MTK_PATH := vendor/styx/soc/mediatek

# Permissions
PRODUCT_COPY_FILES += \
    $(SOC_MTK_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(SOC_MTK_PATH)/permissions/system-ext-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/system-ext-permissions-mediatek.xml

# Secure Computing (seccomp) Policies
PRODUCT_COPY_FILES += \
    $(SOC_MTK_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(SOC_MTK_PATH)/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy \
    $(SOC_MTK_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

