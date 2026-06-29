#!/bin/bash

mkdir -p EvoX
cd EvoX
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf hardware/motorola
rm -rf device/motorola/mumba-kernel
rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba
git clone https://github.com/mumba4ever/android_device_motorola_mumba device/motorola/mumba
git clone https://github.com/mumba4ever/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/mumba4ever/android_device_motorola_mumba-kernel device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola
. build/envsetup.sh
lunch lineage_mumba-bp4a-userdebug
m evolution
