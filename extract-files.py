#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.file import File
from extract_utils.fixups_blob import (
    BlobFixupCtx,
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.tools import (
    llvm_objdump_path,
)
from extract_utils.utils import (
    run_cmd,
)

namespace_imports = [
    'hardware/amazon',
    'device/amazon/mt8695-common',
]

blob_fixups: blob_fixups_user_type = {
    ('vendor/lib/hw/fireos.hardware.audio@4.0-impl.so'): blob_fixup()
        .replace_needed('android.hardware.audio.common@4.0-util.so', 'android.hardware.audio.common@4.0-util-v28.so')
        .replace_needed('libutils.so', 'libutils-v32.so'),
    ('vendor/lib/hw/android.hardware.audio.effect@4.0-impl.so'): blob_fixup()
        .replace_needed('android.hardware.audio.common@4.0-util.so', 'android.hardware.audio.common@4.0-util-v28.so'),
    ('vendor/lib/hw/keystore.mt8695.so'): blob_fixup()
        .add_needed('libkeymaster_messages_shim.so'),
    ('vendor/lib/fireos.hardware.audiosignalprocessor@1.0.so', 'vendor/lib/fireos.hardware.audiosignalprocessor@1.1.so', 'vendor/lib/fireos.hardware.audio@2.0.so', 'vendor/lib/fireos.hardware.audio@4.0.so'): blob_fixup()
        .replace_needed('libhidlbase.so', 'libhidlbase-v32.so'),
    ('vendor/lib/libkmsetkey.so'): blob_fixup()
        .add_needed('libutils.so'),
    ('vendor/lib/libmtklimiter_vendor.so'): blob_fixup()
        .add_needed('liblog.so'),
    ('vendor/lib/vendor.mediatek.hardware.hdmi@1.0.so', 'vendor/lib/vendor.mediatek.hardware.hdmi@1.1.so', 'vendor/lib/fireos.hardware.hdmitxinfo@1.0.so', 'vendor/lib/fireos.hardware.hdcp@1.0.so', 'vendor/lib/vendor.mediatek.hardware.keymanage@1.0.so'): blob_fixup()
        .replace_needed('libhidlbase.so', 'libhidlbase-v32.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'mt8695-common',
    'amazon',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
