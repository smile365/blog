---
title: S905L3-OpenWRT
heading:  
date: 2024-02-14T10:41:57.151Z
categories: ["code"]
tags: 
description:  电视盒子刷 OpenWRT、U 盘启动。
---

## 前言
电视盒子没啥用，想把它刷成 OpenWRT 或者 Armbian 系统。一般来说，盒子的操作系统为 Android TV，地层其实就是 Android。给安卓刷系统，一般是先通过 adb 刷入 fastboot，然后通过 fastboot 刷入其他目标系统。

开启 adb 之后可以通过命令远程控制盒子，但大多数盒子出场时基本都关闭了 adb 功能，所以需要先通过线刷的方式刷入一个已经打开 adb 功能的 TV 系统。

每家盒子的开发人员不一样，有的开发人员为了方便维护可能会留一个后门，比如：
- 耳机孔隐藏了复位键，长按可以通过 usb 启动。
- 遥控器设置了组合按键，循环多次按左右键进入到恢复模式。

**刷机的方式**：
- 卡刷：使用 U 盘刷入系统。
- 线刷：使用 usb 公对公刷入系统。
- 使用编程器把数据写入盒子的存储设备。

以下教程以线刷的方式对一款盒子进行刷机。

**电视盒子信息**
- 名称：移动高清盒子6
- 型号：ZXV10 B860AV3.2-M
- 制造商：中兴通讯股份有限公司
- 省份：云南
- 版本：融合版本
- 芯片厂商：Amlogic（晶晨）
- 芯片型号：S905L3


**需要的工具**
- [amlogic-s9xxx-openwrt 固件](https://github.com/ophub/amlogic-s9xxx-openwrt/blob/main/README.cn.md)
- S905L 短接器
- USB 公对公线


## 步骤
1. 刷入 android 底包，开启 usb 启动。
2. 制作 u 盘启动。

## 参考链接
- [amlogic-s9xxx-armbia](https://github.com/ophub/amlogic-s9xxx-armbian)
- [ZXV10 B860AV3.2-M机顶盒刷armbian教程](https://www.runyf.cn/archives/364/)
- [中兴B860AV3.2-M_S905L3_当贝桌面线刷固件包](https://blog.csdn.net/fatiaozhang9527/article/details/131254885)
- [Openwrt 作为旁路网关](https://sspai.com/post/68511)
- [机顶盒刷armbian全程详解-b站](https://www.bilibili.com/video/BV19h411F7jp)


