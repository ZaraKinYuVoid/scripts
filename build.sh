#!/bin/bash

mkdir -p PixelOS
cd PixelOS
repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr2 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags


rm -rf hardware/motorola
rm -rf device/motorola/mumba-kernel
rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba

git clone https://github.com/ZaraKinYuVoid/android_device_motorola_mumba -b sixteen-qpr2 device/motorola/mumba
git clone https://github.com/ZaraKinYuVoid/android_vendor_motorola_mumba -b sixteen-qpr2 vendor/motorola/mumba
git clone https://github.com/ZaraKinYuVoid/android_device_motorola_mumba-kernel -b main device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

source build/envsetup.sh
breakfast mumba
m pixelos
