#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
BOARD_HAS_MTK_HARDWARE := true
BOARD_VENDOR := amazon
TARGET_BOARD_PLATFORM := mt8695

# Inherit the proprietary files
-include vendor/amazon/mt8695-common/BoardConfigVendor.mk
