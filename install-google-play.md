---
title: 如何安装google play服务
heading: 华为/小米等安卓手机一键安装google play服务方法教程
tags: ["google play"]
date: 2018-06-01
categories: ["code"]
description: 安卓手机如何安装Google服务教程。
---

## 2022年03月07日
之前的方法失效了，请参考[教程](https://www.makeuseof.com/tag/install-gapps-android/)


## 失效的方法
需要[三个东西](https://github.com/hideuvpn/android-google-play-store)
- google service framework (谷歌服务框架)，[下载手机对应的安卓版本](https://www.apkmirror.com/apk/google-inc/google-services-framework/)
- google play service (谷歌Play服务), [下载最新版](https://www.apkmirror.com/apk/google-inc/google-play-services/)
- Google Play Store (谷歌应用市场)， [下载第一个]()。

注意下载的时候 **不是**  Download APK Bundle 类型，而是 Download APK 。最前面有个绿色 `BUNDLE` 标志的不要下载，下载灰色 `apk` 标识的。


**架构**： 这是指手机中的处理器类型。通常，选项为 arm、arm64、x86 和 x86_64。ARM 和 x86 用于 32 位处理器，而 arm64 和 x86_64 用于 64 位处理器。我们将在下面更详细地解释。
**Android 版本**：这是您的设备运行的 Android 操作系统的版本。
**屏幕 DPI**： DPI 代表“每英寸点数”——基本上这是手机屏幕的像素密度。例如，6 英寸全高清屏幕 (1920×1080) 的 DPI 约为 367。将该分辨率提高到 2880×1440，DPI 提高到 ~537。

```bash
# 查看 DPI
adb shell wm density
# Physical density: 440

# 查看 CPU 架构
adb shell getprop ro.product.cpu.abi
# arm64-v8a

# 查看 Android 版本
adb shell getprop ro.build.version.release
# 10
```


参考文档
- [如何查找您的 Android 设备信息以获取正确的 APK 下载](https://www.howtogeek.com/339665/how-to-find-your-android-devices-info-for-correct-apk-downloads/)
- [如何自行寻找最新版的谷歌三件套](https://www.yuncun.xyz/archives/googleservices.html)



