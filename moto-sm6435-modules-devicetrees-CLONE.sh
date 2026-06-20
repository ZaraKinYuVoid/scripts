# Motorola
git clone https://github.com/MotorolaMobilityLLC/motorola-kernel-modules -b MMI-W1WAA36.48-12-40 motorola
rm -rf motorola/.git
git add motorola
git commit -s -m "Add 'motorola/' from TAG MMI-W1WAA36.48-12-40"

# ST NFC
git clone https://github.com/MotorolaMobilityLLC/vendor-st-opensource-driver -b MMI-W1WAA36.48-12-40 st/opensource/driver
rm -rf st/opensource/driver/.git
git add st/opensource/driver
git commit -s -m "Add 'st/opensource/driver/' from TAG MMI-W1WAA36.48-12-40"

# NXP NFC
rm -rf nxp/opensource/driver
git clone https://github.com/MotorolaMobilityLLC/vendor-nxp-opensource-driver -b MMI-W1WAA36.48-12-40 nxp/opensource/driver
rm -rf nxp/opensource/driver/.git
git add nxp/opensource/driver
git commit -s -m "Update 'nxp/opensource/driver/' from TAG MMI-W1WAA36.48-12-40"

# audio-kernel
rm -rf qcom/opensource/audio-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-audio-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/audio-kernel
rm -rf qcom/opensource/audio-kernel/.git
git add qcom/opensource/audio-kernel
git commit -s -m "Update 'qcom/opensource/audio-kernel/' from TAG MMI-W1WAA36.48-12-40"

# bt-kernel
rm -rf qcom/opensource/bt-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-bt-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/bt-kernel
rm -rf qcom/opensource/bt-kernel/.git
git add qcom/opensource/bt-kernel
git commit -s -m "Update 'qcom/opensource/bt-kernel/' from TAG MMI-W1WAA36.48-12-40"

# camera-kernel
rm -rf qcom/opensource/camera-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-camera-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/camera-kernel
rm -rf qcom/opensource/camera-kernel/.git
git add qcom/opensource/camera-kernel
git commit -s -m "Update 'qcom/opensource/camera-kernel/' from TAG MMI-W1WAA36.48-12-40"

# data-kernel
rm -rf qcom/opensource/data-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-data-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/data-kernel
rm -rf qcom/opensource/data-kernel/.git
git add qcom/opensource/data-kernel
git commit -s -m "Update 'qcom/opensource/data-kernel/' from TAG MMI-W1WAA36.48-12-40"

# dataipa
rm -rf qcom/opensource/dataipa
git clone https://github.com/MotorolaMobilityLLC/kernel-msm-techpack-dataipa -b MMI-W1WAA36.48-12-40 qcom/opensource/dataipa
rm -rf qcom/opensource/dataipa/.git
git add qcom/opensource/dataipa
git commit -s -m "Update 'qcom/opensource/dataipa/' from TAG MMI-W1WAA36.48-12-40"

# datarmnet
rm -rf qcom/opensource/datarmnet
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-datarmnet -b MMI-W1WAA36.48-12-40 qcom/opensource/datarmnet
rm -rf qcom/opensource/datarmnet/.git
git add qcom/opensource/datarmnet
git commit -s -m "Update 'qcom/opensource/datarmnet/' from TAG MMI-W1WAA36.48-12-40"

# datarmnet-ext
rm -rf qcom/opensource/datarmnet-ext
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-datarmnet-ext -b MMI-W1WAA36.48-12-40 qcom/opensource/datarmnet-ext
rm -rf qcom/opensource/datarmnet-ext/.git
git add qcom/opensource/datarmnet-ext
git commit -s -m "Update 'qcom/opensource/datarmnet-ext/' from TAG MMI-W1WAA36.48-12-40"

# display-drivers
rm -rf qcom/opensource/display-drivers
git clone https://github.com/MotorolaMobilityLLC/kernel-msm-5.4-techpack-display -b MMI-W1WAA36.48-12-40 qcom/opensource/display-drivers
rm -rf qcom/opensource/display-drivers/.git
git add qcom/opensource/display-drivers
git commit -s -m "Update 'qcom/opensource/display-drivers/' from TAG MMI-W1WAA36.48-12-40"

# dsp-kernel
rm -rf qcom/opensource/dsp-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-dsp-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/dsp-kernel
rm -rf qcom/opensource/dsp-kernel/.git
git add qcom/opensource/dsp-kernel
git commit -s -m "Update 'qcom/opensource/dsp-kernel/' from TAG MMI-W1WAA36.48-12-40"

# graphics-kernel
rm -rf qcom/opensource/graphics-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-graphics-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/graphics-kernel
rm -rf qcom/opensource/graphics-kernel/.git
git add qcom/opensource/graphics-kernel
git commit -s -m "Update 'qcom/opensource/graphics-kernel/' from TAG MMI-W1WAA36.48-12-40"

# mm-drivers
rm -rf qcom/opensource/mm-drivers
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-mm-drivers -b MMI-W1WAA36.48-12-40 qcom/opensource/mm-drivers
rm -rf qcom/opensource/mm-drivers/.git
git add qcom/opensource/mm-drivers
git commit -s -m "Update 'qcom/opensource/mm-drivers/' from TAG MMI-W1WAA36.48-12-40"

# mmrm-driver
rm -rf qcom/opensource/mmrm-driver
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-mmrm-driver -b MMI-W1WAA36.48-12-40 qcom/opensource/mmrm-driver
rm -rf qcom/opensource/mmrm-driver/.git
git add qcom/opensource/mmrm-driver
git commit -s -m "Update 'qcom/opensource/mmrm-driver/' from TAG MMI-W1WAA36.48-12-40"

# mm-sys-kernel
rm -rf qcom/opensource/mm-sys-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-mm-sys-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/mm-sys-kernel
rm -rf qcom/opensource/mm-sys-kernel/.git
git add qcom/opensource/mm-sys-kernel
git commit -s -m "Update 'qcom/opensource/mm-sys-kernel/' from TAG MMI-W1WAA36.48-12-40"

# securemsm-kernel
rm -rf qcom/opensource/securemsm-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-securemsm-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/securemsm-kernel
rm -rf qcom/opensource/securemsm-kernel/.git
git add qcom/opensource/securemsm-kernel
git commit -s -m "Update 'qcom/opensource/securemsm-kernel/' from TAG MMI-W1WAA36.48-12-40"

# spu-kernel
rm -rf qcom/opensource/spu-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-spu-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/spu-kernel
rm -rf qcom/opensource/spu-kernel/.git
git add qcom/opensource/spu-kernel
git commit -s -m "Update 'qcom/opensource/spu-kernel/' from TAG MMI-W1WAA36.48-12-40"

# synx-kernel
rm -rf qcom/opensource/synx-kernel
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-synx-kernel -b MMI-W1WAA36.48-12-40 qcom/opensource/synx-kernel
rm -rf qcom/opensource/synx-kernel/.git
git add qcom/opensource/synx-kernel
git commit -s -m "Update 'qcom/opensource/synx-kernel/' from TAG MMI-W1WAA36.48-12-40"

# video-driver
rm -rf qcom/opensource/video-driver
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-video-driver -b MMI-W1WAA36.48-12-40 qcom/opensource/video-driver
rm -rf qcom/opensource/video-driver/.git
git add qcom/opensource/video-driver
git commit -s -m "Update 'qcom/opensource/video-driver/' from TAG MMI-W1WAA36.48-12-40"

# wlan-fw-api
rm -rf qcom/opensource/wlan/fw-api
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-wlan-fw-api -b MMI-W1WAA36.48-12-40 qcom/opensource/wlan/fw-api
rm -rf qcom/opensource/wlan/fw-api/.git
git add qcom/opensource/wlan/fw-api/
git commit -s -m "Update 'qcom/opensource/wlan/fw-api/' from TAG MMI-W1WAA36.48-12-40"

# wlan-platform
rm -rf qcom/opensource/wlan/platform
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-wlan-platform -b MMI-W1WAA36.48-12-40 qcom/opensource/wlan/platform
rm -rf qcom/opensource/wlan/platform/.git
git add qcom/opensource/wlan/platform/
git commit -s -m "Update 'qcom/opensource/wlan/platform/' from TAG MMI-W1WAA36.48-12-40"

# wlan-qca-wifi-host-cmn
rm -rf qcom/opensource/wlan/qca-wifi-host-cmn
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-wlan-qca-wifi-host-cmn -b MMI-W1WAA36.48-12-40 qcom/opensource/wlan/qca-wifi-host-cmn
rm -rf qcom/opensource/wlan/qca-wifi-host-cmn/.git
git add qcom/opensource/wlan/qca-wifi-host-cmn/
git commit -s -m "Update 'qcom/opensource/wlan/qca-wifi-host-cmn/' from TAG MMI-W1WAA36.48-12-40"

# wlan-qcacld-3.0
rm -rf qcom/opensource/wlan/qcacld-3.0
git clone https://github.com/MotorolaMobilityLLC/vendor-qcom-opensource-wlan-qcacld-3.0 -b MMI-W1WAA36.48-12-40 qcom/opensource/wlan/qcacld-3.0
rm -rf qcom/opensource/wlan/qcacld-3.0/.git
git add qcom/opensource/wlan/qcacld-3.0/
git commit -s -m "Update 'qcom/opensource/wlan/qcacld-3.0/' from TAG MMI-W1WAA36.48-12-40"
