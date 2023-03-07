---
title: linux-vnc
heading:  linux 远程桌面
date: 2023-03-03T08:46:05.976Z
categories: ["code"]
tags: 
description:   linux-vnc-remote desktop protocol
---
## 前言
常用的远程桌面管理协议有以下 2 种：
- `RDP`（remote desktop protocol）协议：远程桌面协议，大部分 Windows 系统都默认支持此协议，Windows 系统中的远程桌面管理就基于该协议。
- `RFB`（Remote FrameBuffer）协议：图形化远程管理协议，VNC 远程管理工具就基于此协议。



## RDP 对比 RFB
- RDP 协议和 RFB 协议都允许用户通过图形用户界面访问远程系统，但 RFB 协议倾向于传输图像，RDP 协议倾向于传输指令：
- RFB 协议会在服务器端将窗口在显存中画好，然后将图像传给客户端，客户端只需要将得到的图像解码显示即可；
- RDP 会将画图的工作交给客户端，服务器端需要根据客户端的显示能力做适当的调整。

因此，完成相同的操作，使用 RFB 协议传输的数据量会比 RDP 大，而 RDP 对客户端的要求比 RFB 更苛刻，RFB 适用于瘦客户端，而 RDP 适用于低速网络。
> 瘦客户端是相对于胖客户端而言的，比如，人们使用 QQ，需要下载客户端，这属于“胖客户”；反之，通过浏览器就可查阅网络上各种资料，无需再下载其他任何软件，这属于“瘦客户”。简单理解，瘦客户端指的是最大可能减轻客户端的负担，多数工作由服务器端完成；胖客户端则相反。


## 使用 VNC 服务端
VNC 服务端软件比较多，例如 TightVNC ，TigerVNC 和 x11vnc。每个VNC 服务端在速度和安全性方面都有其优点和缺点。本教程采用 TigerVNC，它维护积极性能高。

## 安装 TigerVNC
```bash
apt install -y tightvncserver
# 在哪个用户下启动，就会使用哪个用户下的账号，密码为 vnc 的密码。（若没密码，输入 vncserver 会提示创建密码，路径为 ~/.vnc/xxx）
vncserver

```


## 参考文档
- [Linux远程管理协议（RFB、RDP、Telnet和SSH）](http://c.biancheng.net/view/2845.html)
- [在 Ubuntu 22.04 安装 VNC](https://www.myfreax.com/how-to-install-and-configure-vnc-on-ubuntu-22-04/)
- [install-and-configure-vnc](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-22-04)
- [tigervnc-server 无法启动问题](https://www.cnblogs.com/lidune/p/9830780.html)
- [ Make sure an X server isn‘t already running](https://blog.csdn.net/rolaya/article/details/118495564)