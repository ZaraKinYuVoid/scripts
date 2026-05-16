#!/bin/bash

# Repo Init
repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs
repo sync -c --force-sync --no-clone-bundle --no-tags -j$(nproc --all)

rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba
rm -rf device/motorola/mumba-kernel
rm -rf hardware/motorola
rm -rf packages/apps/DolbyUI
rm -rf hardware/dolby

git clone https://github.com/motorola-sm6435/android_device_motorola_mumba -b test device/motorola/mumba
git clone https://github.com/motorola-sm6435/android_vendor_motorola_mumba -b test vendor/motorola/mumba
git clone https://github.com/motorola-sm6435/android_device_motorola_mumba-kernel device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola
git clone https://github.com/swiitch-OFF-Lab/hardware_dolby -b sony-1.5 hardware/dolby
git clone https://github.com/swiitch-OFF-Lab/packages_apps_DolbyUI -b 16.0 packages/apps/DolbyUI

. build/envsetup.sh
lunch lineage_mumba-bp4a-userdebug
m evolution
