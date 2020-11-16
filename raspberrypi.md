---
title:  raspberrypi
date: 2019-07-02T10:35:01.080Z
tags: 
categories:
draft: true
description: 
---

1. 下载树莓派操作系统：[Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
2. 下载[Etcher](https://www.balena.io/etcher/)并安装，然后参考[安装教程](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

开启远程桌面和 ssh 连接。
```bash
sudo raspi-config 
# 选择第 5 项
# 5 Interfacing Options  Configure connections to peripherals  
# 依次设置 P2、P3
# P2 SSH         Enable/Disable remote command line access to your Pi using SSH                      │ 
# P3 VNC         Enable/Disable graphical remote access to your Pi using RealVNC     
```


