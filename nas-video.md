---
title: nas-video 
heading:
date: 2022-04-24T09:57:53.008Z
categories: ["code"]
tags: 
description: 如何观看 nas 上的电影，smb。
---

小米电视自带的“高清播放器”可以自动找到内网中的NAS，以DLNA方式连接；如果需要SMB方式要自行添加NAS的IP地址和NAS的账号密码。

DLNA协议对于无线连接支持很好，即使是4K原盘也可以通过WIFI连接流畅播放，缺点是无法加载外挂字幕。

SMB协议可以切换声道，加载外挂字幕（特效字幕），还能网络自动匹配字幕，缺点是对于无线连接支持很不好（好像最高5MB/S左右），即使是1080P Remux也可能要经常缓冲。

## http(s)

需要搭建一个 web 服务器，读取文件，使用浏览器即可访问。
相关工具如 [alist](https://github.com/Xhofe/alist/blob/v2/README_cn.md)、 [cloudreve](https://github.com/cloudreve/Cloudreve)、 

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
2. 支持 smb 的视频播放器，如 VLC.
3. kodi
4. nplayer
 


## WebDav

[WebDav 比 smb 速度快8~9倍](https://serverdiary.com/featured/webdav-vs-samba-cifs-file-system-write-and-read-speed-test/)

### 电视

小米盒子nplayer 连接群晖webdav服务



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










