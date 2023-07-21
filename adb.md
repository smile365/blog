---
title: adb
heading: Android 设备远程连接 
date: 2023-03-05T01:23:07.038Z
categories: ["code"]
tags: 
description:  
---

## 相关技术
- [ADB](https://developer.android.com/tools/adb)：（Android Debug Bridge，简称：ADB，安卓调试桥），安卓手机里的一个服务，打开后可以接受指令，做出响应。
- adb client：可以理解成给安卓手机发送 adb 指令的软件。可以是图形界面的如：[QtScrcpy](https://github.com/barry-ran/QtScrcpy)、[scrcpy](https://github.com/Genymobile/scrcpy)；也可以仅仅是命令行的如：android-tools-adb；
- [Tailscale](https://tailscale.com/kb/1065/macos-variants/)： 虚拟局域网。adb client 与 安卓手机可以通过 usb 数据线或者 ip 连接。 Tailscale 可以生成一个让 adb client 可以使用的 ip 地址，从而实现在任何地方都能远程控制安卓手机。
  - 服务器在国外，下载 mac 版本或者 ios 版本需要美区 Apple ID。 也可以替换成国内的相似软件[贝锐蒲公英](https://pgy.oray.com/download/personal/#visitor)


## install on debian

```bash
apt install android-tools-adb android-tools-fastboot
adb connect 192.168.0.122:5555
```


## 参考文档
- [远程访问技术对比](https://sspai.com/post/77971)
- [Tailscale 开源版本让你的 WireGuard 直接起飞](https://zhuanlan.zhihu.com/p/485198007)
