---
title: xiaomi8-root 
heading: 2022年小米手机8获取root权限刷机教程
date: 2021-12-27T06:54:25.581Z
categories: ["other"]
tags: 
description: Unlock bootloader of xiaomi devices on mac
---

在苹果mac系统下root小米8手机



## 前言
虽然手上的小米8还能再战两年，但奈何天天被无线快充和120HZ高刷吸引，所以打算22年换个新手机。手上这台就想 root 了之后玩耍下。

> 注： 解锁会清除用户数据，手机会恢复成出厂设置，请提前备份数据。


## 下载解锁工具

按照[小米官方教程](https://www.miui.com/unlock/download.html)先申请解锁手机。

之后需要下载解锁工具 MiFlashUnlock，但是它不能在 Linux 或 Mac 上 运行。

gg 了一番，发现有国外网友开发了能在 mac 上跑的工具 [XiaoMiToolV2](https://github.com.cnpmjs.org/francescotescari/XiaoMiToolV2)。

如果下载慢的话可以把下载地址复制到 [github 镜像站](https://ghproxy.com/) 获得加速下载，谷歌 [github 加速](https://blog.51cto.com/u_15127576/2927752) 也能找到不少。



XiaoMiToolV2 是一个用 java 开发的 JUI 程序，我满怀希望在 mac 上运行时，出现了错误提示： “XiaoMiTool V2”已损坏，无法打开。 您应该将它移到废纸篓。

结果发现是下错版本了，不能下最新版，得下alpha 版本，当然可以运行，但无法解锁。


下载了正确版本发现还是无法解锁，只能用[CrossOver](https://www.crossoverchina.com/)跑小米官方的解锁程序。还是不行，跑不起来。


下载virtual box 装了 window 7 系统，还是不行，手机根本连不到虚拟机里面。


最终还是下载 [parallels desktop](https://www.macwk.com/soft/pd-runner)搞定

pd 无愧是 mac 上最好用的虚拟机软件。


解锁成功后，手机会自动重启，但需要等待很长时间才能进入桌面，不要惊慌。








