---
title: centos-8-usb-boot
heading: 使用u盘制作centos8的usb启动盘通过u盘安装系统
date: 2020-08-13T06:40:52.290Z
categories: ["code"]
tags: 
description:  如何通过USB来安装CentOS ，
---

环境：windows

准备
- UltraISO.exe，
- CentOS-8.2.2004-x86_64-dvd1.iso ，下载地址：http://isoredirect.centos.org/  


系统说明
- stream：支持游戏的系统
- isos：普通系统
    - boot：最小，仅仅包含启动界面，安装时需要联网并配置基础软件仓库。
    - mini：适中，包含启动和系统最低要求的软件。
    - dvd：最全。

　　1、首先将U盘插入电脑的USB接口（重要提示：制作过程U盘会被格式化，注意备份资料）；
　　2、打开UltraISO.exe程序（管理员方式）；
　　4、在打开的UltraISO程序界面，找到并双击下载的.iso映像文件；
　　5、然后在顶部菜单中选择“启动光盘”/“写入硬盘映像”；
　　6、在“硬盘驱动器”项目中，选择你要制作成启动盘的U盘（软件默认选择U盘，不会对硬盘操作，大可放心）；
　　7、在“写入方式”项目中选择“USB-HDD+”或“USB-ZIP+”（尝试选择，制作后能启动电脑为准）；
　　8、最后，点击“写入”按钮，等待数秒，提示“刻录成功”后，点“返回”按钮退出，制作结束。

> 使用boot.iso/和minimal.iso均制作失败。dvd1.iso成功。

参考文献  
- [如何设置USB密钥以安装CentOS](https://wiki.centos.org/zh/HowTos/InstallFromUSBkey)
- [创建可启动的USB驱动器](https://docs.centos.org/en-US/8-docs/standard-install/assembly_preparing-for-your-installation/)