---
title: win11-pve
heading: 
date: 2022-04-02T05:46:41.174Z
categories: ["other"]
tags: 
description: install Windows 11 on pve
---
## 前言

准备工具：

- 下载驱动 [virtio-win-0.1.208-1.iso](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.208-1/)
- 下载系统镜像 [zh-cn_windows_11_business_editions_x64_dvd.iso](https://foxi.buduanwang.vip/pan/%E8%BD%AF%E4%BB%B6%E6%94%B6%E9%9B%86/ISO/)
- 或者[迅雷](https://sysin.org/blog/windows-11/#%E2%AC%87%E4%B8%8B%E8%BD%BD%E5%9C%B0%E5%9D%80)下载   [zh-cn_windows_11.iso](ed2k://|file|zh-cn_windows_11_business_editions_x64_dvd_f5f6bcbd.iso|5413181440|88CA1AE28F5F8A238647561B5C00E511|/)



## 创建虚拟机
参考 [安装教程](https://www.gordon2000.com/2021/10/pvewindows-11-step-by-step.html)

创建一个虚拟机，注意系统版本选择 Windows 11 硬盘设备选择 VirtIO 。

![enter description here](https://cdn.sxy21.cn/static/imgs/1665499632941.png)


## 创建 CD 驱动器挂载驱动

要在 KVM 系统管理器上使用 Windows 操作系统映像，需要在系统上安装 Virtio 驱动程序。使用  CD-ROM  挂载驱动文件 virtio-win-0.1.208-1.iso。

启动虚拟机，按正常步骤安装，到选择安装位置时会无法显示硬盘信息，因为缺少驱动，点击加载驱动程序。然后点击浏览，选择驱动镜像下的amd64 下的 w10 文件夹，点击确定。


如果没有到安装界面是因为没有配置启动项，或者启动项配置错误。通过 PVE 重启虚拟机，然后按 F2 进入 bois 设置启动项为 CD-ROM 即可。可参考[视频教程](https://www.bilibili.com/s/video/BV16L4y1B7F3)

然后搜索激活工具 HEU KMS Activator 或者 AAct Portable 进行激活。




参考文档 
- [Windows 11 简体中文版下载](https://sysin.org/blog/windows-11/#%E2%AC%87%E4%B8%8B%E8%BD%BD%E5%9C%B0%E5%9D%80)
- [pandownload](https://pandownload.net/document/download.html)
- [irtio-win 驱动程序](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)