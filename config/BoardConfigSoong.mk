PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += styxVarsPlugin

SOONG_CONFIG_styxVarsPlugin :=

define addVar
  SOONG_CONFIG_styxVarsPlugin += $(1)
  SOONG_CONFIG_styxVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += styxGlobalVars
SOONG_CONFIG_styxGlobalVars += \
    additional_gralloc_10_usage_bits \
    bootloader_message_offset \
    has_legacy_camera_hal1 \
    ignores_ftp_pptp_conntrack_failure \
    needs_netd_direct_connect_rule \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_fod_lib \
    uses_camera_parameter_lib

SOONG_CONFIG_NAMESPACES += styxNvidiaVars
SOONG_CONFIG_styxNvidiaVars += \
    uses_nv_enhancements

SOONG_CONFIG_NAMESPACES += styxQcomVars
SOONG_CONFIG_styxQcomVars += \
    should_wait_for_qsee \
    supports_extended_compress_format \
    supports_hw_fde \
    supports_hw_fde_perf \
    uses_pre_uplink_features_netmgrd \
    uses_qcom_bsp_legacy \
    uses_qti_camera_device

# Only create soong_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_styxQcomVars += \
    qcom_display_headers_namespace
endif

# Soong bool variables
SOONG_CONFIG_styxGlobalVars_has_legacy_camera_hal1 := $(TARGET_HAS_LEGACY_CAMERA_HAL1)
SOONG_CONFIG_styxGlobalVars_ignores_ftp_pptp_conntrack_failure := $(TARGET_IGNORES_FTP_PPTP_CONNTRACK_FAILURE)
SOONG_CONFIG_styxGlobalVars_needs_netd_direct_connect_rule := $(TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE)
SOONG_CONFIG_styxNvidiaVars_uses_nv_enhancements := $(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)
SOONG_CONFIG_styxQcomVars_should_wait_for_qsee := $(TARGET_KEYMASTER_WAIT_FOR_QSEE)
SOONG_CONFIG_styxQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_styxQcomVars_supports_hw_fde := $(TARGET_HW_DISK_ENCRYPTION)
SOONG_CONFIG_styxQcomVars_supports_hw_fde_perf := $(TARGET_HW_DISK_ENCRYPTION_PERF)
SOONG_CONFIG_styxQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_styxQcomVars_uses_qcom_bsp_legacy := $(TARGET_USES_QCOM_BSP_LEGACY)
SOONG_CONFIG_styxQcomVars_uses_qti_camera_device := $(TARGET_USES_QTI_CAMERA_DEVICE)

# Set default values
BOOTLOADER_MESSAGE_OFFSET ?= 0
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY ?= libcamera_parameters
TARGET_SURFACEFLINGER_FOD_LIB ?= surfaceflinger_fod_lib

# Soong value variables
SOONG_CONFIG_styxGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_styxGlobalVars_bootloader_message_offset := $(BOOTLOADER_MESSAGE_OFFSET)
SOONG_CONFIG_styxGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_styxGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_styxGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_styxGlobalVars_target_surfaceflinger_fod_lib := $(TARGET_SURFACEFLINGER_FOD_LIB)
SOONG_CONFIG_styxGlobalVars_uses_camera_parameter_lib := $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_styxQcomVars_qcom_display_headers_namespace := vendor/qcom/opensource/commonsys-intf/display
else
SOONG_CONFIG_styxQcomVars_qcom_display_headers_namespace := $(QCOM_SOONG_NAMESPACE)/display
endif

