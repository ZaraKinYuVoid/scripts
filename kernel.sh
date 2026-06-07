mkdir toolchains
cd toolchains
URL="https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/0998f421320ae02fddabec8a78b91bf7620159f6/clang-r563880.tar.gz"
echo "[+] Fetching Clang 21 ..."
wget -q -O clang.tar.gz $URL
tar -xf clang.tar.gz && rm clang.tar.gz && cd ..
export PATH="$(pwd)/toolchains/bin:${PATH}"
export TOOLCHAIN_PATH="$(pwd)/bin"
export LD_LIBRARY_PATH="$(pwd)/lib:${LD_LIBRARY_PATH}"
export BUILD_CC="$(pwd)/bin/clang"
export O="${KERNEL_ROOT}/out"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export CLANG_TRIPLE=aarch64-linux-gnu-
export CC="${BUILD_CC}"
export LLVM=1
export LLVM_IAS=1
export AR="${TOOLCHAIN_PATH}/llvm-ar"
export NM="${TOOLCHAIN_PATH}/llvm-nm"
export LD="${TOOLCHAIN_PATH}/ld.lld"
export STRIP="${TOOLCHAIN_PATH}/llvm-strip"
export OBJCOPY="${TOOLCHAIN_PATH}/llvm-objcopy"
export OBJDUMP="${TOOLCHAIN_PATH}/llvm-objdump"
export READELF="${TOOLCHAIN_PATH}/llvm-readelf"
export HOSTCC="${TOOLCHAIN_PATH}/clang"
export HOSTCXX="${TOOLCHAIN_PATH}/clang++"
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y gki_defconfig vendor/parrot_perf.config vendor/ext_config/moto-parrot.config vendor/ext_config/moto-parrot-mumba.config
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc --all)
cd out/arch/arm64/boot
wget https://github.com/Uevo001/magiskboot-linux/raw/refs/heads/main/x86_64/magiskboot
wget https://gitlab.com/zarakinyu/android_dump_motorola_mumba/-/raw/WWAA36V.48-12-ST12.1/boot.img
chmod +x magiskboot
./magiskboot unpack boot.img
rm kernel
mv Image kernel
./magiskboot repack boot.img
wget -q https://raw.githubusercontent.com/kenway214/GoFile-Upload-Script/master/upload.sh -O ~/gofile && chmod +x ~/gofile
echo 'alias gofile="~/gofile"' >> ~/.bashrc && source ~/.bashrc
gofile new-boot.img
