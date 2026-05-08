#!/bin/bash

# Repo Init
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune --retry-fetches=5 -j$(nproc --all)

rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba
rm -rf device/motorola/mumba-kernel
rm -rf hardware/motorola

git clone https://github.com/motorola-sm6435/android_device_motorola_mumba device/motorola/mumba
git clone https://github.com/motorola-sm6435/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/motorola-sm6435/android_device_motorola_mumba-kernel device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

source build/envsetup.sh
lunch lineage_mumba-bp4a-eng
mka bacon
