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
- [Tailscale](https://tailscale.com/download/)： 虚拟局域网。adb client 与 安卓手机可以通过 usb 数据线或者 ip 连接。 Tailscale 可以生成一个让 adb client 可以使用的 ip 地址，从而实现在任何地方都能远程控制安卓手机。


## install on debian

```bash
apt install android-tools-adb android-tools-fastboot
adb connect 192.168.0.122:5555
```