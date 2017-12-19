APP_ABI := armeabi-v7a
#APP_PLATFORM := android-14
APP_STL := stlport_static
APP_STL := gnustl_static
APP_CPPFLAGS +=-std=c++11 #允许使用c++11的函数等功能

#NDK_TOOLCHAIN := arm-linux-androideabi-4.9
#NDK_TOOLCHAIN_VERSION := clang