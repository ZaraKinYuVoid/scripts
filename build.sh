#!/bin/bash

# Repo Init
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune --retry-fetches=5 -j$(nproc --all)

rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba
rm -rf kernel/motorola/sm6435-devicetrees
rm -rf kernel/motorola/sm6435-modules
rm -rf kernel/motorola/sm6435
rm -rf hardware/motorola

git clone https://github.com/motorola-sm6435/android_device_motorola_mumba -b lineage-23.2 device/motorola/mumba
git clone https://github.com/motorola-sm6435/android_vendor_motorola_mumba -b lineage-23.2 vendor/motorola/mumba
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435 -b lineage-23.2 kernel/motorola/sm6435
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435-devicetrees -b lineage-23.2 kernel/motorola/sm6435-devicetrees
git clone https://github.com/motorola-sm6435/android_kernel_motorola_sm6435-modules -b lineage-23.2 kernel/motorola/sm6435-modules
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

source build/envsetup.sh
lunch lineage_mumba-bp4a-eng
mka bacon
