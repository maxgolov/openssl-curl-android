# openssl-curl-android

Compile openssl and curl for Android

## Prerequisites

Make sure you have `Android NDK` installed.

You may also need to install `autoconf` and `libtool` toolchains as well as build essentials.

## Usage

Example build on Linux with AOSP directory checked out:

```bash
git clone https://github.com/maxgolov/openssl-curl-android.git --recurse-submodules

# Your AOSP ANDROID_TOP directory with SDK
export ANDROID_HOME=/android/aosp/out/host/linux-x86/sdk/sdk_phone_x86_64/android-sdk_eng.mgolovanov_linux-x86/

# Your NDK directory
export ANDROID_NDK_HOME=/android/android-ndk-r21d/
export ANDROID_NDK_ROOT=${ANDROID_NDK_HOME}

export MIN_SDK_VERSION=29
export HOST_TAG=linux-x86_64 # see https://developer.android.com/ndk/guides/other_build_systems#overview

chmod +x ./build.sh
./build.sh
```

All compiled libs are located in `build/openssl` and `build/curl` directory.

Use NDK to link those libs, part of `Android.mk` example:

```makefile
include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_SRC_FILES := build/curl/$(TARGET_ARCH_ABI)/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)
```

## Options

- Change scripts' configure arguments to meet your own needs.

- For now, using TLS (https) in Android would throw `peer verification failed`.

  Please explicitly set `curl_easy_setopt(curl, CURLOPT_CAINFO, CA_BUNDLE_PATH);` where `CA_BUNDLE_PATH` is your ca bundle path in the device storage.

  You can download and copy [cacert.pem](https://curl.haxx.se/docs/caextract.html) to Android assets or the device internal storage to get TLS working for libcurl.
