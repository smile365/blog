---
title: 个人媒体音影系统搭建
heading:
date: 2022-04-24T09:57:53.008Z
categories: ["code"]
tags: 
description: 如何观看 nas 上的电影，smb。nas-video 
---


## 需求
虽然目前在线看视频很方便，还有诸多不便，比如找不到想看的片源，受限于版权问题，无法在一个 app 中找到想看的。美剧、国外电影往往没有。搭建了一套黑群晖，这样可以通过远程下载想看的电影到 nas，回到家就可以用电视\手机\iPad 看 nas 里的电影。

## 电视端

小米电视自带的“高清播放器”可以自动找到内网中的NAS，以DLNA 方式连接；如果需要 SMB 方式要自行添加 NAS 的 IP 地址和 NAS 的账号密码。

DLNA 协议对于无线连接支持很好，即使是 4K 原盘也可以通过WIFI连接流畅播放，缺点是无法加载外挂字幕。

SMB 协议可以切换声道，加载外挂字幕（特效字幕），还能网络自动匹配字幕，缺点是对于无线连接支持很不好（好像最高5MB/S 左右），即使是 1080P Remux 也可能要经常缓冲。

需求：
- 支持电视、电脑、手机、平板
- 可插入 u 盘，考走文件。

## 文件拷贝
有时候需要拷贝一个电影分享给朋友，就需要能实现从 nas 拷贝到 u 盘的功能。第一个是插入 u 盘自动挂载，二、文件的浏览、搜索、复制。
步骤：
1. 实现 U 盘的自动挂载
     a. 使用 [autofs](https://linuxconfig.org/automatically-mount-usb-external-drive-with-autofs)
     b. 使用 [usbmount](https://github.com/rbrito/usbmount)（弃用，比较老，10年未更新了）
     c. [mdev](https://www.cnblogs.com/lifexy/p/7891883.html)
2. 文件管理(浏览、搜索、复制)
   a. http(s) 协议的文件管理软件，然后通过另一台设备（电脑、平板、手机）操作文件。稍微不太优雅，需要另一台设备。
   b. 使用 debian 的桌面端版本。比较优雅，稍微比服务器端版本耗费一点资源。
   c. 基于 smb 协议，使用 es文件浏览器 搜索和复制文件。插入 u 盘到 debian，手机操作。（广告多）

### autofs

```bash
apt install -y autofs
lsblk #列出设备
```

### usbmount

需要[自行编译](https://github.com/rbrito/usbmount)安装，编译成功后会在上层目录出现 [.deb](https://blog.csdn.net/wangmg0118/article/details/72026739) 安装包。

```
apt install -y git debhelper build-essential
git clone https://github.com/rbrito/usbmount.git
cd usbmount 
pkg-buildpackage -us -uc -b
# apt install -y git-buildpackage
# https://mirrors.tuna.tsinghua.edu.cn/help/debian/
cd ..
# 安装依赖
# apt -f install 
# 安装
# dpkg -i usbmount_0.0.24_all.deb
apt install -y gdebi
gdebi usbmount_*.deb
```

### udev
创建配置文件，
并编写[udev规则](https://linux.cn/article-10329-1.html)
借助[udev]((https://www.cnblogs.com/zhouhbing/p/4025748.html))

```
lsblk 
udevadm monitor 
# pve usb passthrough
# pve 挂载 u 盘（下次重启才生效）
# lsusb |grep CoolFlash
# qm set 104 -usb3 host=23a9:ef18

# 立即生效
# qm monitor 104
# device_add usb-host,vendorid=0x058f,productid=0x6387,id=someid
```

/etc/udev/rules.d
20-local.rules
journalctl -f

```
ACTION=="add",GOTO="farsight"
SUBSYSTEM!="block",GOTO="farsight"
KERNEL=="sd[a-z][0-9]?",RUN+="/sbin/umount-usb.sh"
LABEL="farsight"

ACTION!="remove",GOTO="farsight"
SUBSYSTEM!="block",GOTO="farsight"
KERNEL=="sd[a-z][0-9]?",RUN+="/etc/udev/rules.d/trigger.sh"
LABEL="farsight"


```

## http(s)

需要搭建一个 web 服务器，读取文件，使用浏览器即可访问。
相关工具如 [alist](https://github.com/Xhofe/alist/blob/v2/README_cn.md)、 [cloudreve](https://github.com/cloudreve/Cloudreve)、[filebrowser](https://github.com/filebrowser/filebrowser) 

- alist
    - 优点：支持众多网盘，可预览大部分文件，配置多个虚拟路径。
    - 缺点：不支持搜索；bug 比较多；有复制，但没粘贴？
- cloudreve
    - xxx
- filebrowser
    - 优点：简洁，支持搜索，批量操作，自适应（支持手机端操作）
    - 缺点：不支持预览，不支持配置虚拟路径，不支持添加多文件夹（可以使用正则）

这里推荐使用 `filebrowser`

### alist
使用[自动脚本](https://alist-doc.nn.ci/docs/install/script)安装
```bash
curl -fsSL "https://nn.ci/alist.sh" | bash -s install
```


### cloudreve
下载发布的[二进制包](https://docs.cloudreve.org/getting-started/install)安装

```bash
# 下载
wget https://github.com/cloudreve/Cloudreve/releases/download/3.5.1/cloudreve_3.5.1_linux_amd64.tar.gz

#解压获取到的主程序
tar -zxvf cloudreve_VERSION_OS_ARCH.tar.gz

# 赋予执行权限
chmod +x ./cloudreve

# 启动 Cloudreve
./cloudreve
```

### filebrowser
使用命令[自动安装](https://filebrowser.org/installation)
自适应的，支持手机浏览器。
```bash
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
filebrowser -a 10.0.0.114 -r /path/to/your/files
```

## smb 

smb 协议可以把另一台电脑的文件共享出去，其他电脑访问如同访问本地文件一样。

### Mac OS X 苹果电脑
方法一：直接访问
1. 群晖->控制面板->文件服务，启用 smb 服务
2. 安装合适的视频[播放器](https://www.yinxiang.com/everhub/note/5c17a619-ad6a-4d82-8a5d-1fa1d4d647b2)，如 [射手](https://www.splayer.org/)、 [iina](https://github.com/iina/iina)、 [nplayer](https://apps.apple.com/cn/app/nplayer/id1451273814)
3. 在 [finder](https://support.apple.com/zh-cn/guide/mac-help/mchlp1236/mac) 在 Mac 上的“访达” 中，选取“前往”>“链接服务器”。（快捷键 cmd+k）,输入：smb://ip地址，填写账号密码。
4. 用 finder 打开“位置”下的 smb 地址，即可看到文件，双击即可播放。

方法二：通过支持 smb 的播放器

原理与‘通过 smb’一样，只不过入口不是 mac 的 finder，而是播放器而已。


### Windows 电脑
参考[主流平台访问samba共享文件夹方法总结](https://github.com/wupanhao/wupanhao.github.io/issues/1)

### Android 手机/平板
参考[主流平台访问samba共享文件夹方法总结](https://github.com/wupanhao/wupanhao.github.io/issues/1)

### iOS 手机/ iPad
参考[主流平台访问samba共享文件夹方法总结](https://github.com/wupanhao/wupanhao.github.io/issues/1)

### 电视



1. 打开小米电视–>高清播放器–>设备–>添加设备。
2. 支持 smb 的视频播放器，如 [VLC](https://www.videolan.org/vlc/)
3. [当贝市场](https://www.dangbei.com/app/) 搜索 [kodi](https://www.znds.com/tv-1162916-1-1.html) 并安装
4. [当贝市场](https://www.dangbei.com/app/) 搜索 nplayer 并安装
5. [电视播放器 当贝/Kodi/VLC 对比实测 ](https://www.znds.com/tv-1179018-1-1.html)
 


## WebDav

[WebDav 比 smb 速度快8~9倍](https://serverdiary.com/featured/webdav-vs-samba-cifs-file-system-write-and-read-speed-test/)

### 电视

小米电视安装 nplayer 连接 webdav 服务



## DLNA
没法外挂字幕（不支持加载相同目录下的字幕）。

### 电视
支持 dlan 的视频播放器，如 VLC.


## ftp/sftp

## AFP

## NTFS 













## Windows 电脑

## iphone 手机

## iPad 平板


## Android 手机

## Android 平板






## 参考文档

- [编译usbmount](https://www.linuxuprising.com/2019/04/automatically-mount-usb-drives-on.html)
- [mdev](https://blog.csdn.net/weixin_43229139/article/details/106903710)



