#
# Copyright (C) 2020 Raphielscape LLC.
# Copyright (C) 2020 Team StormBreaker
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

# Inherit from our versioning
$(call inherit-product, vendor/styx/config/versioning.mk)

# Inherit from our kernel/header generator
$(call inherit-product, vendor/styx/config/BoardConfigStyx.mk)

# Inherit from fonts
$(call inherit-product, vendor/styx/fonts/fonts.mk)

# Inherit prebuilt packages
$(call inherit-product, vendor/styx/prebuilts/targets.mk)

# Inherit overlays
$(call inherit-product, vendor/styx/overlay/overlays.mk)

# Inherit properties
TARGET_PRODUCT_PROP += vendor/styx/config/properties/product.prop
TARGET_SYSTEM_PROP += vendor/styx/config/properties/system.prop

# Inherit system packages
$(call inherit-product, vendor/styx/config/packages.mk)

