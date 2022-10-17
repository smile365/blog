---
title:  pve-Proxmox VE
heading:  裸机安装 Proxmox VE- pve 系统 7.2-1
date: 2022-09-06T06:33:45.328Z
categories: ["code"]
tags: 
description: 
---
## 安装 pve 系统
通过 u 盘启动安装 [Proxmox VE](https://pve.proxmox.com/pve-docs/pve-admin-guide.html) 系统。

通过官网下载 iso 镜像 [proxmox-ve_7.2-1.iso](https://www.proxmox.com/en/downloads/category/iso-images-pve),推荐先下载 BitTorrent 然后通过迅雷等 bt 工具下载，国内下载 pve 系统特别慢。或者通过[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/proxmox/)镜像站下载


下载后放入已经制作好的 ventoy 的 u 盘中，插入电脑，设置 bios 从 u 盘启动。安装系统的时候建议插上网线，不然装完系统配置网络比较麻烦。

如果有硬盘，需要[手动添加到 pve 系统](https://blog.csdn.net/qq_22182829/article/details/119682405)。
```bash
# 查看磁盘
lsblk
fdisk /dev/sda
# 按提示依次输入 n/1/y/w
mkfs -t ext4 /dev/sda1
mkdir -p /mnt/data
mount /dev/sda1 /mnt/data
echo /dev/sda1 /mnt/data ext4 defaults 1 2 >> /etc/fstab
reboot
fdisk -l
df -h
```


然后依次点击 数据中心 -> 存储 -> 添加目录，填写 data、/mnt/data、磁盘映像 即可。


![](https://cdn.sxy21.cn/static/imgs/1662708792404.png)

## 准备系统镜像和模板
如果使用 linux，且不需要桌面环境，那推荐使用 CT 模板创建 Linux 容器，安装非常快速，CT 模板文件一般百兆以内。下载 CT 路径：local -> CT 模板 / 模板

依次点击 local -> ISO 镜像/ CT 模板，上传镜像或模板。
镜像下载地址：[tuna](https://mirrors.ustc.edu.cn/proxmox/images/system/)
模板下载地址：[proxmox-ct](https://mirrors.ustc.edu.cn/proxmox/images/system/)

ISO 镜像是用来创建虚拟机的，能力相当于 virtual box 。
CT 模板是用来创建 [LXC 容器](https://262235.xyz/index.php/archives/727/)的，能力相当于 docker。

![enter description here](https://cdn.sxy21.cn/static/imgs/1662749923230.png)

## 使用 pve 制作 软路由

qm importdisk 100 /var/lib/vz/template/iso/r2s-slim.img local-lvm




## 使用 pve 制作 win 11 系统

准备工具：

- 下载驱动 [virtio-win-0.1.208-1.iso](https://foxi.buduanwang.vip/pan/%E8%BD%AF%E4%BB%B6%E6%94%B6%E9%9B%86/%E8%99%9A%E6%8B%9F%E5%8C%96/KVM/%E9%A9%B1%E5%8A%A8/)
- 下载系统镜像 [zh-cn_windows_11_business_editions_x64_dvd.iso](https://foxi.buduanwang.vip/pan/%E8%BD%AF%E4%BB%B6%E6%94%B6%E9%9B%86/ISO/)
- 或者[迅雷](https://sysin.org/blog/windows-11/#%E2%AC%87%E4%B8%8B%E8%BD%BD%E5%9C%B0%E5%9D%80)下载   [zh-cn_windows_11.iso](ed2k://|file|zh-cn_windows_11_business_editions_x64_dvd_f5f6bcbd.iso|5413181440|88CA1AE28F5F8A238647561B5C00E511|/)



参考 [安装教程](https://www.gordon2000.com/2021/10/pvewindows-11-step-by-step.html)

如果没有到安装界面是因为没有配置启动项，或者启动项配置错误。通过 PVE 重启虚拟机，然后按 F2 进入 bois 设置启动项为 CD-ROM 即可。可参考[视频教程](https://www.bilibili.com/s/video/BV16L4y1B7F3)

然后搜索激活工具 HEU KMS Activator 或者 AAct Portable 进行激活。


## CentOS-Stream-9
如果网速特别好的话可以通过网络安装操作系统，先下载 boot 镜像，安装过程参考[NetBoot ISO 安装 CentOS 8](https://linuxhint.com/install_centos8_netboot_iso/)。
1. 下载 [CentOS-Stream-9-20221003.2-x86_64-boot.iso](http://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/)
2. 正常安装，先配制好 network 再点击 Installation Source
3  一般会自动获取，不会的话，选择 close mirror，自定义填入 mirrors.aliyun.com/centos/8-stream/BaseOS/x86_64/os/

## Debian 11

下载 [debian-11.5.0-amd64-netinst.iso](https://www.debian.org/download)


## deepin 23
下载[deepin-desktop-community-23-preview-amd64.iso](https://www.deepin.org/zh/download/)

## linux-mint 
介绍参考: [个人桌面级 Linux 操作系统](https://www.iplaysoft.com/linux-mint.html)
从阿里云的镜像下载 [linuxmint-21-cinnamon-64bit.iso](https://linuxmint.com/edition.php?id=299)

## Chrome OS Flex

系统介绍可参考[Chrome OS Flex 安装与体验](https://sspai.com/post/72764),安装参考[在PVE中安装chromeos flex](https://yyr.moe/index.php/100/)


## 创建 CT
1. 先下载模板，依次点击 local -> CT 模板 / 模板，搜索需要使用的模板。
2. 下载成功后点击创建 CT，选择刚刚下载好的模板
3. 网络选择 DHCP （默认是静态，需要自己设置 ip）
4. 配置 ssh
```bash
# 安装 openssh
yum install -y openssh-server
# 修改配置文件 
vi /etc/ssh/sshd_config
# cat /etc/ssh/sshd_config
Port 22
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::

PermitRootLogin yes
```

## 创建模板


## 备份和快照


## 参考文档 
- [Windows 11 简体中文版下载](https://sysin.org/blog/windows-11/#%E2%AC%87%E4%B8%8B%E8%BD%BD%E5%9C%B0%E5%9D%80)
- [pandownload](https://pandownload.net/document/download.html)



