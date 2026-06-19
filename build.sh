#!/bin/bash

mkdir -p evolutionX
cd evolutionX
repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba
rm -rf device/motorola/mumba-kernel
rm -rf hardware/motorola

git clone https://github.com/motorola-sm6435/android_device_motorola_mumba -b test device/motorola/mumba
git clone https://github.com/motorola-sm6435/proprietary_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/motorola-sm6435/android_device_motorola_mumba-kernel -b test device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

. build/envsetup.sh
lunch lineage_mumba-bp4a-eng
mka bacon

git clone https://github.com/motorola-sm6435/android_device_motorola_mumba device/motorola/mumba
git clone https://github.com/motorola-sm6435/proprietary_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435 kernel/motorola/sm6435
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435-modules kernel/motorola/sm6435-modules
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435-devicetrees kernel/motorola/sm6435-devicetrees
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola
