#
# Copyright (C) 2018-2019 The Pixel3ROM Project
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

PLATFORM_STYX_VERSION_MAJOR := 2.0
PLATFORM_STYX_VERSION_MINOR := alpha3
PLATFORM_STYX_RELEASE := $(PLATFORM_STYX_VERSION_MAJOR)-$(PLATFORM_STYX_VERSION_MINOR)

TARGET_PRODUCT_SHORT := $(subst styx_,,$(TARGET_DEVICE))

ifeq ($(STYX_BUILD_VARIANT),OFFICIAL)
    PROD_VERSION += styx-$(PLATFORM_STYX_RELEASE)-$(TARGET_DEVICE)-$(shell date +%m%d%H%M)-OFFICIAL
else
    PROD_VERSION += styx-$(PLATFORM_STYX_RELEASE)-$(TARGET_DEVICE)-$(shell date +%m%d%H%M)-UNOFFICIAL
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.styx.version=$(PLATFORM_STYX_RELEASE)
