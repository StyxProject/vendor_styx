#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 StormbreakerOSS
# Copyright (C) 2021 Styx Project
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
ifneq ($(SIGNING_KEYS),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(SIGNING_KEYS)/releasekey
endif

PLATFORM_STYX_VERSION := 2.0
STYX_BUILD_VARIANT ?= UNOFFICIAL
TARGET_PRODUCT_SHORT := $(subst styx_,,$(TARGET_DEVICE))
STYX_DATE_UTC := $(shell date -u '+%Y%m%d-%H%M')

PROD_VERSION += styx-$(PLATFORM_STYX_VERSION)-$(TARGET_DEVICE)-$(STYX_BUILD_VARIANT)-$(STYX_DATE_UTC)

STYX_PROPERTIES += \
    org.styxproject.version=$(PLATFORM_STYX_VERSION) \
    org.styxproject.release_type=$(STYX_BUILD_VARIANT) \
    org.styxproject.device=$(TARGET_DEVICE)

ifneq ($(filter OFFICIAL,$(STYX_BUILD_VARIANT)),)
PRODUCT_PACKAGES += \
    Updater
endif
