#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amazon/mt8695-common

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.batteryless \
    android.hardware.health-service.batteryless_recovery

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

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product-if-exists, vendor/amazon/mt8695-common/mt8695-common-vendor.mk)
