#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PLATFORM_PATH := device/cyanogen/msm8916-common

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

TARGET_NO_BOOTLOADER := true

# Architecture
ifneq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

TARGET_USES_64_BIT_BINDER := true
endif

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
# Allow building audio encoders
TARGET_USES_QCOM_MM_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/vendor/bin/mm-qcamera-daemon=23

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT := true
  endif
endif

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false

# DexPreopt debug info
WITH_DEXPREOPT_DEBUG_INFO := false

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Display
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_ION := true
BOARD_USES_ADRENO := true
TARGET_DISABLE_POSTRENDER_CLEANUP := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(PLATFORM_PATH)/config.fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_FOLDERS := firmware persist

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXCLUDE_SERIF_FONTS := true
SMALLER_FONT_FOOTPRINT := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.btmacaddr=00:00:00:00:00:00
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_HAS_MEMFD_BACKPORT := true
TARGET_KERNEL_SOURCE := kernel/cyanogen/msm8916

# Manifest
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
ifeq ($(TARGET_USE_CRYPTFS_HW),true)
DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/cryptfs_hw.xml
endif

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Power
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(PLATFORM_PATH)/power/power_ext.c
endif
TARGET_USES_INTERACTION_BOOST := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Radio
MALLOC_SVELTE := true
MALLOC_SVELTE_FOR_LIBC32 := true
TARGET_RIL_VARIANT := caf

# Recovery
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_cm

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# SELinux
#include device/qcom/sepolicy-legacy/sepolicy.mk
TARGET_EXCLUDE_QCOM_SEPOLICY := true
BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy_tmp

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib64/libflp.so|libshims_flp.so \
    /system/vendor/lib64/libizat_core.so|libshims_get_process_name.so \
    /system/vendor/lib64/libril-qc-qmi-1.so|libshims_ril.so \
    /system/vendor/lib/libflp.so|libshims_flp.so \
    /system/vendor/lib/libizat_core.so|libshims_get_process_name.so \
    /system/vendor/lib/libril-qc-qmi-1.so|libshims_ril.so

# Dedupe VNDK libraries with identical core variants.
TARGET_VNDK_USE_CORE_VARIANT := true

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn

PRODUCT_VENDOR_MOVE_ENABLED := true
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
TARGET_USES_QCOM_WCNSS_QMI := true

WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
