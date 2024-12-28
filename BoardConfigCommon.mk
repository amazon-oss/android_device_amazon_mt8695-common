#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Boot Image
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery loop.max_part=8
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x14000000
BOARD_RAMDISK_OFFSET := 0x15000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_RAMDISK_USE_XZ := true

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board ""

# Bootloader
TARGET_NO_BOOTLOADER := true

# Filesystems
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    hardware/amazon/vintf/amazon_framework_compatibility_matrix.xml \
    hardware/mediatek/vintf/mediatek_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.9/bin
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/amazon/mt8695
TARGET_KERNEL_CONFIG := mt8695_defconfig amazon/$(PRODUCT_DEVICE).config
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE ?= 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE ?= 16777216
BOARD_VENDORIMAGE_PARTITION_SIZE ?= 157286400

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM := system

# Platform
BOARD_HAS_MTK_HARDWARE := true
BOARD_VENDOR := amazon
TARGET_BOARD_PLATFORM := mt8695

# Properties
TARGET_VENDOR_PROP := $(COMMON_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.mt8695

# Screen
TARGET_SCREEN_DENSITY := 320

# Verified Boot
BOARD_AVB_ENABLE := false

# VNDK
BOARD_VNDK_VERSION := current

# Inherit the proprietary files
-include vendor/amazon/mt8695-common/BoardConfigVendor.mk
