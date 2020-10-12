#!/bin/bash

export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH

# curl common configuration arguments
ARGUMENTS="--disable-shared \
    --disable-verbose \
    --disable-manual \
    --disable-crypto-auth \
    --disable-unix-sockets \
    --disable-ares \
    --disable-rtsp \
    --disable-ipv6 \
    --disable-proxy \
    --disable-versioned-symbols \
    --enable-hidden-symbols \
    --without-libidn \
    --without-librtmp \
    --without-zlib \
    --disable-dict \
    --disable-file \
    --disable-ftp \
    --disable-ftps \
    --disable-gopher \
    --disable-imap \
    --disable-imaps \
    --disable-pop3 \
    --disable-pop3s \
    --disable-smb \
    --disable-smbs \
    --disable-smtp \
    --disable-smtps \
    --disable-telnet \
    --disable-tftp"

mkdir -p build/curl
cd curl
./buildconf

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-ssl=$SSL_DIR $ARGUMENTS

make -j5
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# armv7a
export TARGET_HOST1=arm-linux-androideabi
export TARGET_HOST=armv7a-linux-androideabi
export ANDROID_ARCH=armeabi-v7a
export AR=$TOOLCHAIN/bin/${TARGET_HOST1}-ar
export AS=$TOOLCHAIN/bin/${TARGET_HOST1}-as
export CC=$TOOLCHAIN/bin/${TARGET_HOST}${MIN_SDK_VERSION}-clang
export CXX=$TOOLCHAIN/bin/${TARGET_HOST}${$MIN_SDK_VERSION}-clang++
export LD=$TOOLCHAIN/bin/${TARGET_HOST1}-ld
export RANLIB=$TOOLCHAIN/bin/${TARGET_HOST1}-ranlib
export STRIP=$TOOLCHAIN/bin/${TARGET_HOST1}-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-ssl=$SSL_DIR $ARGUMENTS

make -j5
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# x86
export TARGET_HOST=i686-linux-android
export ANDROID_ARCH=x86
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-ssl=$SSL_DIR $ARGUMENTS

make -j5
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-ssl=$SSL_DIR $ARGUMENTS

make -j5
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

cd ..
