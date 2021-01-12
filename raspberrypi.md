---
title:  raspberrypi
date: 2019-07-02T10:35:01.080Z
tags: 
categories:
draft: true
description: 
---

Raspberry Pi OS（原为Raspbian）是为树莓派基于Debian开发的操作系统。

1. 下载树莓派操作系统：[Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
2. 下载[Etcher](https://www.balena.io/etcher/)并安装，然后参考[安装教程](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)
3. [让树莓派启动直接连接WIFI](http://sonicguo.com/2019/Initialize-RaspBerry-3-with-wifi/)

开启远程桌面和 ssh 连接。
```bash
sudo raspi-config 
# 选择第 5 项
# 5 Interfacing Options  Configure connections to peripherals  
# 依次设置 P2、P3
# P2 SSH         Enable/Disable remote command line access to your Pi using SSH                      │ 
# P3 VNC         Enable/Disable graphical remote access to your Pi using RealVNC     
```

也可以使用桌面方式配置
![依次点击](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610433840402.png) 


测试 ssh 连接
```bash
ssh pi@your_ip
# 树莓派默认登录名和密码是：pi, raspberry
```


vnc 连接需要安装 [vnc 客户端](https://www.realvnc.com/en/connect/download/viewer/)。


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1605523846409.png)


插上网线，上不了网，ifconfig 不显示有线网络的地址。原因时树莓派的有线网卡没开启。

sudo nano /etc/network/interfaces
iface eth0 inet dhcp

查看无线网络配置
cat /etc/wpa_supplicant/wpa_supplicant.conf


若树莓派无限重启，一般是电源电压不够（可能是充电头或电源线）。

wifi配置失败，网线配置失败，如何配置树莓派
网络（有线、无线）：插网线无反应，WIFI不自动连接。
鼠标、键盘：没有鼠标键盘
显示器：没有显示器
HDMI，输出，大部分屏幕还是 VGA。买 HDMI 转 VGA 的需要带电源。






参考链接
- [开启有线网卡](http://www.nrjs.cn/ctt/11120032.html)
- [nano教程](https://www.vpser.net/manage/nano.html)
- [树莓派花屏或自动重启](http://www.raspigeek.com/index.php?c=read&id=98&page=1)