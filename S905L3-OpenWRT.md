---
title: S905L3-OpenWRT
heading:  
date: 2024-02-14T10:41:57.151Z
categories: ["code"]
tags: 
description:  电视盒子刷 OpenWRT、U 盘启动。
---

## 说明
电视盒子没啥用，想把它刷成 OpenWRT 或者 Armbian 系统。

- 卡刷：使用 U 盘刷入系统。
- 线刷：使用 usb 公对公刷入系统。

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


