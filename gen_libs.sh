#!/bin/bash
# Generate JNI libraries.
# "ndk_build" is a path of NDK build tool. Please modify it, before using.
ndk_build=~/DevTools/android-sdk/ndk-bundle/ndk-build
$ndk_build -B NDK_PROJECT_PATH=./camera/jni NDK_APPLICATION_MK=./camera/jni/Application.mk APP_BUILD_SCRIPT=./camera/jni/Android.mk NDK_LIBS_OUT=./camera/libs