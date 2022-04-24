---
title: nas-video 
heading:
date: 2022-04-24T09:57:53.008Z
categories: ["code"]
tags: 
description: 如何观看 nas 上的电影，smb。
---

## 协议介绍

### http(s)

需要搭建一个 web 服务器，读取文件，使用浏览器即可访问。
相关工具如 [alist](https://github.com/Xhofe/alist/blob/v2/README_cn.md)、 [cloudreve](https://github.com/cloudreve/Cloudreve)、 

### smb

### ftp/sftp

### WebDav

### AFP

### NTFS 

### DLNA


## 电视

小米电视上的操作
打开小米电视–>高清播放器–>设备–>添加设备。



## mac 电脑

### 通过 smb

smb 协议可以把另一台电脑的文件共享出去，其他电脑访问如同访问本地文件一样。

1. 群晖->控制面板->文件服务，启用 smb 服务
2. 安装合适的视频[播放器](https://www.yinxiang.com/everhub/note/5c17a619-ad6a-4d82-8a5d-1fa1d4d647b2)，如 [射手](https://www.splayer.org/)、 [iina](https://github.com/iina/iina)、 [nplayer](https://apps.apple.com/cn/app/nplayer/id1451273814)
3. 在 [finder](https://support.apple.com/zh-cn/guide/mac-help/mchlp1236/mac) 在 Mac 上的“访达” 中，选取“前往”>“链接服务器”。（快捷键 cmd+k）,输入：smb://ip地址，填写账号密码。
4. 用 finder 打开“位置”下的 smb 地址，即可看到文件，双击即可播放。


### 通过网页

### 通过支持 smb 协议的播放器

原理与‘通过 smb’一样，只不过入口不是 mac 的 finder，而是播放器而已。


## Windows 电脑

## iphone 手机

## iPad 平板


## Android 手机

## Android 平板










