#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC.
# Copyright (C) 2020 Team StormBreaker
# Copyright (C) 2023 The Styx Project
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

PLATFORM_STYX_VERSION := 3.0.0
PLATFORM_STYX_VERSION_INCR := staging1
PLATFORM_STYX_VERSION := $(PLATFORM_STYX_VERSION)+$(PLATFORM_STYX_VERSION_INCR)

# Guidelines for setting Styx Build ID:
#  - TR1  = T Release 1
#  - 33   = API Level 33
#  - OSR  = Open Source Release
#  - RF00 = Production Release 00

PLATFORM_STYX_BUILD_ID := TR1.33.OSR.RF00

PLATFORM_STYX_VERSION := $(PLATFORM_STYX_VERSION)-$(TARGET_DEVICE)-$(shell date +%Y%m%d%S)

ifneq ($(STYX_BUILD_VARIANT),)
    PLATFORM_STYX_VERSION := $(PLATFORM_STYX_VERSION)-$(TARGET_DEVICE)-$(shell date +%Y%m%d%S)-$(STYX_BUILD_VARIANT)
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.styx.version=$(PLATFORM_STYX_VERSION) \
    ro.styx.build.id=$(PLATFORM_STYX_BUILD_ID)
