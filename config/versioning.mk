#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 StormbreakerOSS
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
PLATFORM_STYX_RELEASE := Athena
PLATFORM_STYX_VERSION := $(PLATFORM_STYX_RELEASE).$(shell date +%m%d%H%M)

TARGET_PRODUCT_SHORT := $(subst styx_,,$(TARGET_DEVICE))

ifeq ($(TARGET_BUILD_VARIANT),OFFICIAL)
    PLATFORM_STYX_VERSION := $(PLATFORM_STYX_RELEASE)
    PROD_VERSION += styxOS-$(PLATFORM_STYX_RELEASE)-$(TARGET_DEVICE)-$(shell date +%m%d%H%M)-OFFICIAL
else
    PLATFORM_STYX_VERSION := $(PLATFORM_STYX_RELEASE)
    PROD_VERSION += styxOS-$(PLATFORM_STYX_RELEASE)-$(TARGET_DEVICE)-$(shell date +%m%d%H%M)-UNOFFICIAL
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.styx.version=$(PLATFORM_STYX_VERSION) \
    org.styxproject.release=$(PLATFORM_STYX_RELEASE)
