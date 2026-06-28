#!/bin/bash

mkdir -p los
cd los
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags


rm -rf hardware/motorola
rm -rf device/motorola/mumba-kernel
rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba

git clone https://github.com/JNWSG/android_device_motorola_mumba device/motorola/mumba
git clone https://github.com/JNWSG/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/ZaraKinYuVoid/android_device_motorola_mumba-kernel -b main device/motorola/mumba-kernel
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola

source build/envsetup.sh
lunch lineage_mumba-bp4a-userdebug
mka bacon

rm -rf hardware/motorola
rm -rf kernel/motorola/sm6435-devicetrees
rm -rf kernel/motorola/sm6435-modules
rm -rf kernel/motorola/sm6435
rm -rf device/motorola/mumba
rm -rf vendor/motorola/mumba

git clone https://github.com/ZaraKinYuVoid/device_motorola_mumba device/motorola/mumba
git clone https://github.com/ZaraKinYuVoid/android_vendor_motorola_mumba vendor/motorola/mumba
git clone https://github.com/LineageOS/android_hardware_motorola -b lineage-23.2 hardware/motorola
git clone https://github.com/ZaraKinYuVoid/sm6435-modules kernel/motorola/sm6435-modules
git clone https://github.com/ZaraKinYuVoid/android_kernel_motorola_sm6435-devicetrees kernel/motorola/sm6435-devicetrees
git clone https://github.com/ZaraKinYuVoid/android_kernel_motorola_sm6435 kernel/motorola/sm6435




# DTB / DTBO
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true
TARGET_NEEDS_DTBOIMAGE := true
TARGET_MERGE_DTBS_WILDCARD ?= parrot-moto-base*

# Init Boot
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# Boot
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Kernel
BOARD_KERNEL_CMDLINE += \
    console=ttynull \
    nosoftlockup \
    printk.devkmsg=on \
    firmware_class.path=/vendor/firmware_mnt/image \
    qcom_geni_serial.con_enabled=0 \
    sysctl.kernel.firmware_config.force_sysfs_fallback=1

BOARD_BOOTCONFIG += \
    androidboot.hardware=qcom \
    androidboot.load_modules_parallel=true \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    androidboot.hypervisor.protected_vm.supported=true \
    androidboot.vendor.qspa=true

BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x00000000
BOARD_RAMDISK_USE_LZ4 := true
TARGET_KERNEL_NO_GCC := true
TARGET_KERNEL_VERSION := 6.6

TARGET_KERNEL_SOURCE := kernel/motorola/sm6435
TARGET_KERNEL_VERSION := 6.6

TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/parrot_perf.config \
    vendor/ext_config/moto-parrot.config \
    vendor/ext_config/moto-parrot-mumba.config

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules/modules.blocklist.vendor_dlkm
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules/modules.blocklist.vendor_boot
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.system_dlkm))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.vendor_dlkm))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules/modules.load.vendor_boot $(DEVICE_PATH)/modules/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)
SYSTEM_KERNEL_MODULES := $(BOARD_SYSTEM_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/motorola/sm6435-modules
TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/mm-drivers/msm_ext_display \
    qcom/opensource/mm-drivers/sync_fence \
    qcom/opensource/audio-kernel \
    qcom/opensource/securemsm-kernel \
    qcom/opensource/synx-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/data-kernel/drivers/smem-mailbox \
    qcom/opensource/datarmnet-ext/mem \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/dsp-kernel \
    qcom/opensource/graphics-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/wlan/platform \
    qcom/opensource/wlan/qcacld-3.0/.adrastea \
    qcom/opensource/bt-kernel \
    nxp/opensource/driver \
    st/opensource/driver \

TARGET_KERNEL_EXT_MODULES += \
    motorola/drivers/moto_swap \
    motorola/drivers/moto_reboot_reason \
    motorola/drivers/moto_f_usbnet \
    motorola/drivers/mmi_info \
    motorola/drivers/mmi_relay \
    motorola/drivers/moto_mm \
    motorola/drivers/misc/mmi_sys_temp \
    motorola/drivers/moto_mmap_fault \
    motorola/drivers/moto_netopt/con_dfpar \
    motorola/drivers/moto_binder \
    motorola/drivers/power/mmi_charger \
    motorola/drivers/misc/mmi_stow \
    motorola/drivers/mmi_annotate \
    motorola/drivers/moto_sched \
    motorola/drivers/watchdogtest \
    motorola/drivers/misc/sx937x \
    motorola/drivers/misc/stk501xx \
    motorola/drivers/misc/utag \
    motorola/drivers/power/qpnp_adaptive_charge \
    motorola/drivers/power/bm_adsp_ulog \
    motorola/drivers/power/qti_glink_charger \
    motorola/drivers/power/bq27426_fg_mmi \
    motorola/drivers/power/sgm4154x_charger_lite \
    motorola/drivers/regulator/dio8015 \
    motorola/drivers/regulator/wl2864c \
    motorola/drivers/regulator/wl2866d \
    motorola/drivers/regulator/slg5bm43670 \
    motorola/drivers/misc/awinic/sarsensor \
    motorola/drivers/fm \
    motorola/drivers/backlight/ktd3136 \
    motorola/drivers/backlight/aw99703 \
    motorola/drivers/nfc/st21nfc \
    motorola/drivers/sensors \
    motorola/drivers/ese/st54x \
    motorola/drivers/ese/st54spi_gpio \
    motorola/drivers/input/touchscreen/chipone_tddi_v3_mmi \
    motorola/drivers/input/touchscreen/ilitek_v4_mmi \
    motorola/drivers/input/misc/anc_fps_mmi \
    motorola/drivers/wlan_antenna
