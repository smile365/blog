---
title:  openwrt
heading:
date: 2022-10-18T08:58:26.402Z
categories: ["code"]
tags: 
description: 
---
## 前言

环境：
- 硬件：小米路由器 4a 千兆版
- 固件版本：[openwrt-22.03.2](https://downloads.openwrt.org/releases/22.03.2/targets/ramips/mt7621/)


工具介绍：
- [shadowsocks-libev](https://github.com/shadowsocks/openwrt-shadowsocks)
	- ss-redir ，代理 tcp 流量（开启 udp_relay）
	- ss-tunnel ，转发 dns 解析请求
- [ChinaDNS](https://github.com/aa65535/openwrt-chinadns)，同时配置国内和国外 dns，对比后返回正确 ip，代替国内 DNS。
- [DNS-Forwarder](https://github.com/aa65535/openwrt-dns-forwarder)，缓存 dns 结果 ，提高效率。

使用命令行配置比较麻烦可以配合 [LuCI ](https://github.com/aa65535/openwrt-dist-luci)的界面工具使用。

下载安装包：
- shadowsocks 可以通过 opkg 安装，参考下方
-  在 ChinaDNS 的 releases 界面下载  [ChinaDNS_mipsel_24kc.ipk ](https://openwrt-dist.sourceforge.net/archives/ChinaDNS/1.3.3-1/current/mipsel_24kc/)。
-  在 luci 的 [releases](https://github.com/aa65535/openwrt-dist-luci/releases)界面下载 luci-app-chinadns、luci-app-dns-forwarde。
-  把下载的 ipk 文件通过路由器后台依次上传安装。
-  安装完可能需要退出后重新登录。



## 安装 ss



## 配置 ss

先配置远端服务器
开启 ss_redir





## 配置 dns-forwarder

1. 勾选启用
2. 如果提示「DNS 转发 - 未运行」可以在路由器的 shell 环境执行
 ```bash
 /etc/init.d/dns-forwarder status
 /etc/init.d/dns-forwarder start
 # 开机自启动
 # /etc/init.d/dns-forwarder enable 
 ```

## 配置 chinadns
1. 勾选启用
2. 上游服务器改成 114.114.114.114,127.0.0.1:5300
3. 如果提示「ChinaDNS - 未运行」，可以在路由器的 shell 环境执行
```bash 
/etc/init.d/chinadns status
/etc/init.d/chinadns start
 # 开机自启动
 # /etc/init.d/chinadns enable 
 
```
4. 如果还是启动不起来，可以手动运行调试
```bash
chinadns -b 0.0.0.0 -p 5353 -s 114.114.114.114,127.0.0.1:5300 -c /etc/chinadns_chnroute.txt -v

# -b 本地监听ip
# -p 本地监听port
# -s 指定上游dns服务器，必须至少有一个国内dns、一个国外dns
# -c 指定大陆地址段文件
# -l 指定ip黑名单文件
# -m 启用dns压缩指针
# -v 打印详细信息
```

## 配置 dns 服务器
1. 路由器后台点击 网络 -> dns 
2. 本地 dns 改成 127.0.0.1#5353
3. 测试结果如下
```bash
root@OpenWrt:~# nslookup www.google.com
Server:		127.0.0.1
Address:	127.0.0.1:53

Non-authoritative answer:
Name:	www.google.com
Address: 128.121.243.77

Non-authoritative answer:
Name:	www.google.com
Address: 2001::a88f:a234
```


## 转发规则
1. 点击 服务 -> shadowsocks -> 转发规则
2. 常用设置，取消勾选禁用
3. 目的地地址，绕过：
```bash
# ss 远端服务器 ip
0.0.0.0/8
127.0.0.0/8
192.168.0.0/16
```
4. 目的未匹配时默认行为：forward
5. 重启路由器，测试如下：
```bash
root@OpenWrt:~# nslookup www.google.com
Server:		127.0.0.1
Address:	127.0.0.1:53

Non-authoritative answer:
Name:	www.google.com
Address: 142.250.217.132

Non-authoritative answer:
Name:	www.google.com
Address: 2001::a88f:a234
```
6. 浏览器打开 google.com 正常，打开百度搜索 id，发现是国外的 ip。证明没有做分流。也就是除了转发规则里「绕过」的 ip 外，其他都会走代理。我们需要做到国内 ip 不走代理。


## 分流
仅国外域名走代理，使用 gwlist。
1. 安装依赖和下载 gwlist
```bash
# 查看 dnsmasq 是否支持 ipset
dnsmasq -v |grep ipset
# 不支持的话需要安装 dnsmasq-full
opkg update
opkg remove dnsmasq
opkg install dnsmasq-full --force-overwrite
opkg install ipset iptables-mod-nat-extra

mkdir /etc/dnsmasq.d
# 在 dnsmasq.d 的 配置项会自动合并到 /var/etc/dnsmasq.conf.cfg01411c
echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf
cd /etc/dnsmasq.d
wget https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf
```

2. 配置 ipset 和 iptables
```bash
#创建名为gfwlist，格式为iphash的集合
ipset -N gfwlist iphash
#匹配gfwlist中ip的nat流量均被转发到shadowsocks端口
iptables -t nat -A PREROUTING -p tcp -m set --match-set gfwlist dst -j REDIRECT --to-port 1100
#匹配gfwlist中ip的本机流量均被转发到shadowsocks端口
iptables -t nat -A OUTPUT -p tcp -m set --match-set gfwlist dst -j REDIRECT --to-port 1100
# 查看是否配置正确
iptables -t nat -L


```

3. 点击 服务 -> shadowsocks -> 转发规则
4. 目的地址设定 -> 目的未匹配时默认行为：bypass
5. 重启防火墙
```bash
# 检测 dnsmasq 是否配置正确
dnsmasq --test
# 重启防火墙
/etc/init.d/dnsmasq restart
# udhcpc: started, v1.35.0
# udhcpc: broadcasting discover
# udhcpc: no lease, failing

# 测试 dns 国外域名
nslookup www.google.com
# Server:		127.0.0.1
# Address:	127.0.0.1:53
# Non-authoritative answer:
# Name:	www.google.com
# Address: x.x.x.x
# Non-authoritative answer:
# Name:	www.google.com
# Address: 2001::68f4:2bf8

# 测试 dns 国内域名
nslookup www.baidu.com
# 

# 查看是否有 ip 地址
ipset -L
# 数量大雨 0 就行
# Number of entries: 17
```
6. 上网检测
	1. 百度搜索 ip，ip 地址正常（国内）。
	2. 访问谷歌，正常访问，搜索 my ip 提示是 vps 的 ip。
  
## 问题解决
```bash
root@OpenWrt:~# nslookup www.baidu.com
nslookup: write to '127.0.0.1': Connection refused
nslookup: write to '::1': Connection refused
;; connection timed out; no servers could be reached

lsof -i:53
# 无任何输出，端口没有被程序监控，应该是 dnsmasq 没有起来
/etc/init.d/dnsmasq status
# 提示 running

# 有可能是 dnsmasq 启动较慢，等几分钟，或者重启路由器。
# 也可以手动启动排查
dnsmasq -D -C /etc/dnsmasq.conf
```



## 参考文档
- [ChinaDNS-NG](https://iwan.ga/archives/401)
- [ss-redir 做透明代理](http://ivo-wang.github.io/2018/02/24/ss-redir/)
- [透明代理的几种实现方式](https://libertyleadingnetwork.blogspot.com/2019/08/shadowsocksss-redirprivoxytpproxy.html)
- [使用 GFWList 路由规则](https://linhongbo.com/posts/shadowsocks-on-openwrt-with-gfwlist/)
- [使用DNS-Forwarder](https://jayshao.com/shi-yong-dns-forwardti-sheng-chinadnswen-ding-xing/)
- [Openwrt上实现透明代理](https://www.keepwn.com/posts/see-the-big-world-on-openwrt/)
- [Openwrt 使用 ipset 和 gwlist](https://www.keepwn.com/howto/route-traffic-selectively-by-domain-on-openwrt/)
- [ipset 参数](https://www.cnblogs.com/cangqinglang/p/12199849.html)
- [ipset 配置](https://www.cnblogs.com/milton/p/14399410.html)
