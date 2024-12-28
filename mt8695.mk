#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amazon/mt8695-common

# Disable A/B target features
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
AB_OTA_UPDATER := false

ifneq ($(AB_OTA_UPDATER), true)
PRODUCT_SOONG_NAMESPACES += \
    bootable/deprecated-ota
endif

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl

PRODUCT_PACKAGES += \
    libdrm.vendor

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl.custom \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.batteryless \
    android.hardware.health-service.batteryless_recovery

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl

PRODUCT_PACKAGES += \
    libkeymaster3device.vendor

# Rootdir
PRODUCT_PACKAGES += \
    init.mt8695.rc \
    init.mt8695.usb.rc \
    init.connectivity.rc \
    init.project.rc \
    init.nvdata.rc \
    fstab.mt8695 \
    fstab.mt8695.ramdisk \
    ueventd.mt8695.rc

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.recovery.mt8695.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt8695.rc

# Shims
PRODUCT_PACKAGES += \
    libkeymaster_messages_shim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/amazon \
    hardware/mediatek

# Inherit the proprietary files
$(call inherit-product-if-exists, vendor/amazon/mt8695-common/mt8695-common-vendor.mk)
