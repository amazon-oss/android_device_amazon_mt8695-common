#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/amazon/mt8695-common

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product-if-exists, vendor/amazon/mt8695-common/mt8695-common-vendor.mk)
