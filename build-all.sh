#!/bin/bash

export ANDROID_HOME="${ANDROID_HOME:=/android/aosp/out/host/linux-x86/sdk/sdk_phone_x86_64/android-sdk_eng.mgolovanov_linux-x86/}"
export ANDROID_NDK_HOME="${ANDROID_NDK_HOME:=/android/android-ndk-r21d/}"
export ANDROID_NDK_ROOT=${ANDROID_NDK_HOME}
export MIN_SDK_VERSION="${MIN_SDK_VERSION:=29}"
export HOST_TAG="${HOST_TAG:=linux-x86_64}"

export CFLAGS="-Os -ffunction-sections -fdata-sections -fno-unwind-tables -fno-asynchronous-unwind-tables"
export LDFLAGS="-Wl,-s -Wl,-Bsymbolic -Wl,--gc-sections"

chmod +x ./build.sh
./build.sh
