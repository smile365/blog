---
title:  openwrt
heading:
date: 2022-10-18T08:58:26.402Z
categories: ["code"]
tags: 
description: 
---
## 前言

工具介绍：
- [shadowsocks-libev](https://github.com/shadowsocks/openwrt-shadowsocks)
	- ss-redir ，代理 tcp 流量（开启 udp_relay）
	- ss-tunnel ，转发 dns 解析请求
- [ChinaDNS](https://github.com/aa65535/openwrt-chinadns)，替代国内 dns 防止污染，同时配置国内和国外 dns，对比后返回正确 ip。
- [DNS-Forwarder](https://github.com/aa65535/openwrt-dns-forwarder)，缓存 dns 结果 ，提高效率。

使用命令行配置比较麻烦可以配合 [LuCI ](https://github.com/aa65535/openwrt-dist-luci)的界面工具使用。

下载安装包：
- shadowsocks 可以通过 opkg 安装，参考下方
-  在 ChinaDNS 的 releases 界面下载  [ChinaDNS_mipsel_24kc.ipk ](https://openwrt-dist.sourceforge.net/archives/ChinaDNS/1.3.3-1/current/mipsel_24kc/)。
-  在 luci 的 [releases](https://github.com/aa65535/openwrt-dist-luci/releases)界面下载 luci-app-chinadns、luci-app-dns-forwarde。
-  把下载的 ipk 文件通过路由器后台依次上传安装。
-  安装完可能需要退出后重新登录。



## 安装 ss



## 配置 


/etc/init.d/chinadns status
/etc/init.d/dns-forwarder status

## 参考文档
- [更强大的防DNS污染方案ChinaDNS-NG，以及学习自编写luci界面](https://iwan.ga/archives/401)
- [ss-redir做透明代理](http://ivo-wang.github.io/2018/02/24/ss-redir/)
