mkdir -p toolchains
cd toolchains
URL="https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-14.0.0_r33/clang-r510928.tar.gz"
aria2c \
    -x16 \
    -s16 \
    -k1M \
    -o clang.tar.gz \
    "$URL"
tar -xf clang.tar.gz
rm clang.tar.gz
cd ..
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
