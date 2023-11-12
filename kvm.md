---
title: kmv
heading:  
date: 2023-10-28T08:47:11.754Z
categories: ["code"]
tags: 
description:  如何给普通 PC 实现 ipmi 功能
---

## 前言
一些概念
- IPMI，[Intelligent Platform Management Interface](https://www.bilibili.com/video/BV1FQ4y1f7iT/)
- KVM，Keyboard Video Mouse
- USB
- USB OTG



介绍 ipmi，用途。

## 思路
网络
屏幕
键盘
USB 设备

桥接，搭一座桥

视频输出（HDMI） ---> 视频输入
USB 接口 <----> 软件模拟出 USB HUB （任意类型的 USB 设备）----



## 解决方案

- 至少两个 USB 的设备。一个「从属设备」模式，接收视频数据，显示界面。一个「主设备」模式，模拟鼠标键盘，发送鼠标键盘信号。也就是说，至少需要一个支持 OTG 功能的 USB。这种 USB 一般直接接入 CPU，让 CPU 直接发送命令，而不是接入 USB 集线器，当做设备给 CPU 读取。 
- HDMI 采集卡。
- 可运行 KVM 软件的硬件。

## 软件
- [Open IP-KVM](https://github.com/Nihiue/open-ip-kvm)
- PiKVM 

## 硬件
可以运行 armbian 或者 openwrt ，且带 OTG USB 的硬件都可以
- 树莓派(zero)/香橙派/R2S
- 电视盒子
- 斐讯 n1
- 随身WiFi


## 下载 os
从 [nanopi-r2s-rk3328.img.bz2
](https://github.com/Yura80/os) 下载


## 给电脑开机有什么办法
- 按开机键
- WOL 信号（需主板支持，大部分主板）
- IPMI（需主板支持，仅服务器主板）
- 改装电脑开机键，使用设备接管电脑电源接口
- 使用 KVM 方案（主板需含有 OTG 功能的 usb 接口）

## 目前遇到的问题

1. 忘记交电费，停电。电恢复后电脑不开机。
bios 设置来点开机

2. 电脑死机，或者误敲命令关机。
bios 设置周期性开机，如每天早上 10 电，需要等一天。

3. 死机，无法进入控制台，需要重启。

4. 需要重新安装系统。









## 参考文档
- [基于PiKVM制作M1 Mac Mini KVM](https://blog.cyyself.name/pikvm-m1-mac-mini/)
- [open-ip-kvm](https://github.com/Nihiue/open-ip-kvm)
- [使用 Orangepi Zero 构建一个低成本的 Pikvm](https://www.bilibili.com/read/cv21169636/)
- [打造普通PC拥有服务器IPMI硬件级别的远程运维方案 PI KVM 硬件级远程控制](https://github.com/toss-a/pikvm-armbian/blob/master/README-zh-CN.MD)
- [50元自制IP-KVM兼容4G LTE -视频](https://www.bilibili.com/video/BV1dc411N7zh)
- [远程开机？10块钱搞定-2分 20 秒处](https://www.bilibili.com/video/BV1JX4y1V7mi)
- [通过USB远程唤醒电脑，无需WOL支持](https://www.bilibili.com/video/BV1mz4y1r7EL)









