---
title:  nano-pi-r2s
heading: 
date: 2022-09-14T07:48:57.809Z
categories: ["code"]
tags: 
description:  NanoPi R2S mac osx 固件烧录教程
---
固件烧录步骤：
1. 到官网下载 [FriendlyWrt系统固件](http://wiki.friendlyelec.com/wiki/index.php/NanoPi_R2S/zh#.E5.AE.89.E8.A3.85.E7.B3.BB.E7.BB.9F)，将下载的 rk3328-sd-friendlywrt-22.03-YYYYMMDD.img.gz 文件解压。
2. 使用 [etcher](https://www.balena.io/etcher) 把 img 文件烧录到 tf 卡中，然后把 tf 卡插入 r2s 。
3. 用网线连接路由器和 r2s wan 口（远离 type-c 口的网口），插入电源启动。
4. 到路由器查看新连接的 ip 证明启动成功。
6. 用一根网线连接笔记本和 r2s 的 lan 口（靠近 type-c 的网口）。
7. 浏览器进入 FriendlyWrt 管理页面 [http://friendlywrt/](http://192.168.2.1/):
8. 密码 password 




![enter description here](https://cdn.sxy21.cn/static/imgs/1663144573181.png)





 opkg install kcptun-client
 /etc/config/kcptun
 kcptun-client -v
 