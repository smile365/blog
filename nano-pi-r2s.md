---
title:  nano-pi-r2s
heading: 
date: 2022-09-14T07:48:57.809Z
categories: ["code"]
tags: 
description:  NanoPi R2S mac osx 固件烧录教程
---
## 固件烧录

固件烧录步骤：
1. 到官网下载 [FriendlyWrt系统固件](http://wiki.friendlyelec.com/wiki/index.php/NanoPi_R2S/zh#.E5.AE.89.E8.A3.85.E7.B3.BB.E7.BB.9F)，将下载的 rk3328-sd-friendlywrt-22.03-YYYYMMDD.img.gz 文件解压。
2. 使用 [etcher](https://www.balena.io/etcher) 把 img 文件烧录到 tf 卡中，然后把 tf 卡插入 r2s 。
3. 用网线连接路由器和 r2s wan 口（远离 type-c 口的网口），插入电源启动。
4. 到路由器查看新连接的 ip 证明启动成功。
6. 用一根网线连接笔记本和 r2s 的 lan 口（靠近 type-c 的网口）。
7. 浏览器进入 FriendlyWrt 管理页面 [http://friendlywrt/](http://192.168.2.1/):
8. 密码 password 


![](https://cdn.sxy21.cn/static/imgs/1663144573181.png)
## 安装 ss

开启 ssh 并登录 ssh root@192.168.2.1 修改软件下载的镜像为清华源[OpenWRT (LEDE) 镜像](https://mirrors.tuna.tsinghua.edu.cn/help/openwrt/)

安装 [ss](https://linhongbo.com/posts/shadowsocks-on-openwrt/#step-4%E5%8F%AF%E9%80%89---%E8%AE%A9%E8%B7%AF%E7%94%B1%E5%99%A8%E8%87%AA%E8%BA%AB%E4%B9%9F%E7%BF%BB%E5%A2%99) 和  [ss web ui](https://github.com/shadowsocks/luci-app-shadowsocks)
```bash
# 替换源
sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' /etc/opkg/distfeeds.conf
opkg update

# 安装 ss
opkg install shadowsocks-libev-ss-local shadowsocks-libev-ss-redir shadowsocks-libev-ss-rules shadowsocks-libev-ss-tunnel

## 安装 ss 的 web-ui
opkg install luci-app-shadowsocks-libev

```


## 安装 kcptun

```
opkg install kcptun-client
scp /Users/songyangcong/Downloads/luci-app-kcptun_1.5.3_all.ipk root@192.168.2.1:/tmp
scp /Users/songyangcong/Downloads/luci-i18n-kcptun-zh-cn_git-20.109.30409-d04c89b_all.ipk root@192.168.2.1:/tmp
opkg install /tmp/luci-app-kcptun_1.5.3_all.ipk --force-overwrite --force-maintainer
opkg install /tmp/luci-i18n-kcptun-zh-cn_git-20.109.30409-d04c89b_all.ipk

# kcptun-client -v
```
 
 ## 配置 ss
 
 
 ## 安装 dns
 使用 [ChinaDNS](http://douxinchun.github.io/blog/20210302/install-shadowsocks-on-openwrt.html)避免 域名解析污染
 
 ```bash 
 opkg print-architecture
 # # aarch64_generic
 # vim /etc/opkg/customfeeds.conf 
 # 增加软件源
src/gz openwrt_dist http://openwrt-dist.sourceforge.net/packages/base/aarch64_generic
src/gz openwrt_dist_luci http://openwrt-dist.sourceforge.net/packages/luci

opkg install ChinaDNS
opkg install luci-app-chinadns

```