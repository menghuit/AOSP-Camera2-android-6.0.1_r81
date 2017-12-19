JNI修改编译
------
使用gen_libs.sh 脚本编译生成so库。注意需要修改这个脚本里的NDK路径。


JNI 编译报错
-----------  
1. jni/jpegutil.h 报 'array' file not found。  
    Application.mk 添加如下代码  
    ```
    APP_STL := stlport_static  
    APP_STL := gnustl_static  
    APP_CPPFLAGS +=-std=c++11 #允许使用c++11的函数等功能
    ```
2. 找不到jpeglib.h  
   修改jpegutile.cpp 里 `#include "jpeglib.h"` 改成 `#include "external_jpeg/jpeglib.h"` 指明jpeglib.h 的具体路径

2. external_jpeg/jddctmgr.c:40: error: undefined reference to 'armv6_idct' collect2: error: ld returned 1 exit status  
   原因："armv6_idct.S" 这个汇编源码文件没有添加到编译列表中。  
   将 `LOCAL_SRC_FILES_arm += armv6_idct.S` 改成 `LOCAL_SRC_FILES += armv6_idct.S`

3. ABI 支持  
  有平台支持的问题，没有细看，所以现只编译 armeabi-v7a   
  在Applicaiton.mk 添加 APP_ABI := armeabi-v7a


ndk-build 编译参数说明
--------------------
```
NDK_PROJECT_PATH
说明：指定工程目录
示例：ndkbuild NDK_PROJECT_PATH=C:\Hello

NDK_LIBS_OUT
说明：指定.so文件输出目录，默认值为"$(NDK_PROJECT_PATH)/libs"
示例：ndkbuild NDK_LIBS_OUT=C:\Hello\libs

NDK_APPLICATION_MK
说明：指定Application.mk文件路径，默认值为"$(NDK_PROJECT_PATH)/jni/Application.mk"
示例：ndkbuild NDK_APPLICATION_MK=C:\Hello\src\Application.mk

NDK_DEBUG
说明：打开或关闭调试模式，debug模式时会生成gdbserver等文件
示例：ndkbuild NDK_DEBUG=1

NDK_LOG
说明：显示内部NDK日志消息（用于调试NDK自身）
示例：ndkbuild NDK_LOG=1

NDK_HOST_32BIT
说明：Always use toolchain in 32-bit mode (see below).
示例：ndkbuild NDK_HOST_32BIT=1

APP_BUILD_SCRIPT
说明：指定Android.mk文件路径，默认值为"$(APP_PROJECT_PATH)/jni/Android.mk"
示例：ndkbuild APP_BUILD_SCRIPT=C:\Hello\src\Android.mk

Clear
说明：清除所有生成的二进制文件
示例：ndkbuild Clear

-B
说明：强制完全重新构建
示例：ndkbuild -B

-C <project>
说明：构建位于<工程目录>的工程的本地代码。当你不想在终端上用cd切换到那个目录时有用
示例：ndkbuild -C C:\Hello

V
说明：打开或关闭显示编译参数
示例：ndkbuild V=1
```
