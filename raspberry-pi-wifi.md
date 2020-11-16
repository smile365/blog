---
title:  raspberry Pi wifi
heading:
date: 2020-11-13T02:23:10.038Z
categories: ["code"]
tags: 
description: 
---

树莓派自动链接wifi方案

背景

每次切换 WIFI 环境时，手头没有显示器、键盘、鼠标等套件，无法通过桌面环境配置树莓派得 WIFI 网络。

树莓派开机自动执行一个脚本

准备一个公网媒介，把
把 WIFI 名称和密码写入到一个公网可读取得

打开 WIFI

开始扫码特定 wifi


手机打开一个热点，名字和密码特定。

树莓派连接 WIFI


把需要连接的 WIFI 和密码放到一个公网媒介中，如：后端网站、数据库、gitee私有地址。

准备一个脚本。
 1. 开机自动打开 WIFI
 2. 扫描特定 wifi
 3. 等待手机打开热点
 4. 连接热点后去准备好的媒介读取 WIFI 名称和密码
 5. 断开当前连接
 6. 连接获取到的 wifi 。 

手机打开一个热点，按照脚本里的设定的名称和密码提供一个热点。


    
参考文献：
- [自动连接wifi](https://unix.stackexchange.com/questions/92799/connecting-to-wifi-network-through-command-line)






