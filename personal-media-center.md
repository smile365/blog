---
title: personal-media-center 
heading: 
date: 2022-01-26T10:51:31.900Z
categories: ["other"]
tags: 
description: 打造家庭媒体中心，Personal Media Center
---


## 需求
随时随地都能添加标准和非标准

- 设备类型：支持公网、手机、电脑、平板
- 媒体类型
    - 标准媒体：公开发行的电影、电视剧、动漫
    - 非标准：你懂的


![enter description here](https://gitee.com/smile365/blogimg/raw/master/小书匠/1643194483988.png)



Proxmox Virtual Environment 安装黑群晖、路由器、Linux虚拟机等。

安装[PVE](https://www.10bests.com/install-proxmox-ve/)

Proxmox VE，是一个开源的服务器虚拟化环境Linux发行版。Proxmox VE基于Debian，使用基于Ubuntu的定制内核，包含安装程序、网页控制台和命令行工具。


下载[pve](https://www.proxmox.com/en/downloads/category/iso-images-pve)

用迅雷 bt 下载，官方下载很慢。

把 iso 文件用 [etcher](https://www.balena.io/etcher/) 写入 u 盘即可。（注：mac下 容量会变小，且会被分区成三份）

安装时最好设备插入网线，否则配置网络特别麻烦，有可能无法上网。


mac os 下 使用 etcher 刻录系统以后 U 盘容量变小，如何恢复容量？


```bash
# 查看磁盘列表，找到 external physical 外部物理磁盘即为 U 盘。
diskutil list
# 取消挂载
diskutil umountDisk /dev/disk3
# 使用0覆盖所有扇区（比较慢，可不执行）
# diskutil zeroDisk /dev/disk3
# 格式化
diskutil eraseDisk ExFAT myupan /dev/disk3 
```

```bash
diskutil eraseDisk format name [APM | MBR | GPT] device
```

diskutil eraseDisk 可选项说明：
 - format：指定抹掉后的文件系统（如 FAT32、ExFAT、APFS）
- name：抹掉后磁盘的名称
- APM|MBR|GPT：磁盘的类型（可不填）
- device：设备ID



更新镜像源 [Debian 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)

参考教程[配置WIFI](https://linuxconfig.org/how-to-connect-to-wifi-from-the-cli-on-debian-10-buster)

```bash
apt-get install wireless-tools
iwconfig
iwlist wlp9s0 scan
ifup wlp9s0
iwlist wlp9s0 scan | grep ESSID
wpa_passphrase CMCC-nJ9A tqyb6cne > /etc/wpa_supplicant/wpa_supplicant.conf

```




参考 
- [年轻人的第一个全自动个人影音库-效果展示](https://www.bilibili.com/video/BV19S4y1Q7nB)
- [Mac 上将U盘格式化为 ExFAT](https://sspai.com/post/68573)
- [MAC OS 烧录ISO文件到U盘](https://blog.csdn.net/Aria_Miazzy/article/details/104321607)
- [Mac 使用终端彻底格式化U盘](https://blog.csdn.net/chenhao_c_h/article/details/102552874)
- [macOS下磁盘管理diskutil命令详解](https://blog.csdn.net/weixin_41136293/article/details/108766145)

