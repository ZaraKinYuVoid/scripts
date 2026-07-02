#!/bin/bash

mkdir -p EvoX
cd EvoX
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf hardware/motorola
rm -rf device/motorola/mumba-kernel
rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba

git clone https://github.com/ZaraKinYu-Playground/android_device_motorola_mumba device/motorola/mumba
git clone https://github.com/ZaraKinYu-Playground/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/mumba4ever/android_device_motorola_mumba-kernel device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

. build/envsetup.sh
lunch lineage_mumba-bp4a-eng
mka bacon -j$(nproc --all)



git clone https://github.com/mumba4ever/android_device_motorola_mumba -b oss-kernel device/motorola/mumba
git clone https://github.com/mumba4ever/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/mumba4ever/android_kernel_motorola_sm8450 kernel/motorola/sm8450
git clone https://github.com/mumba4ever/android_kernel_motorola_sm8450-modules kernel/motorola/sm8450-modules
git clone https://github.com/mumba4ever/android_kernel_motorola_sm8450-devicetrees kernel/motorola/sm8450-devicetrees
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola



