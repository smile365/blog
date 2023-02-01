---
title:  wireguard
heading: 
date: 2021-12-16T02:20:30.706Z
categories: ["other"]
tags: 
description: wireguard 内网穿透
---
## 网络拓扑结构
![enter description here](https://cdn.sxy21.cn/static/imgs/1675260160422.png)
 
实现内网穿透并访问局域网内的其他服务。

## debian 安装 WireGuard

```bash
# 安装
apk install -y wireguard 
cd /etc/wireguard
# 生成私钥
wg genkey > privatekey
# 通过私钥导出公钥
wg pubkey < privatekey > publickey
# 一次性生成私钥和公钥 
# wg genkey | tee privatekey | wg pubkey > publickey

```

编辑配置文件 `vim /etc/wireguard/wg0.conf`，内如如下：
```
[Interface]
Address = 10.0.8.1
SaveConfig = true
ListenPort = 51820
PrivateKey = 【debian的私钥】 
```


## alpine 安装 WireGuard
```bash
# 开启 ip 转发
# sysctl -a |grep ipv4.ip_forward
sudo sysctl net.ipv4.ip_forward=1

apk add -U wireguard-tools

cd /etc/wireguard && wg genkey | tee privatekey | wg pubkey > publickey
cat /etc/wireguard/publickey 
vi wg0.conf

[Interface]
Address = 10.0.8.2
SaveConfig = true
ListenPort = 49152
PrivateKey = 【alpine 的私钥】
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = 【debian 的公钥】
AllowedIPs = 10.0.8.0/24
Endpoint = sxy21.cn:51820
PersistentKeepalive = 25
```


在 debian 服务器上加入 alpine 的 peer
```bash
wg set wg0 peer 【alpine 的公钥】 allowed-ips 10.0.8.2/32,192.168.0.0/24
```

**测试**
```bash
# 在 debian 服务器上
ping 10.0.8.2
ping 192.168.0.167
ping 192.168.0.175

# 在 alpine 服务器上
ping 10.0.8.1
```



## mac 安装 WireGuard


客户端[命令](https://www.wireguard.com/quickstart/#command-line-interface)

```bash
brew install wireGuard
# Bottle installation failed
# Run brew update twice and brew doctor (and fix all the warnings) before creating an issue!
# 测试是否安装
wg version
查看帮助
wg help
```

帮助文档： 
```bash
Usage: wg <cmd> [<args>]
Available subcommands:
  show: Shows the current configuration and device information
  showconf: Shows the current configuration of a given WireGuard interface, for use with `setconf'
  set: Change the current configuration, add peers, remove peers, or change peers
  setconf: Applies a configuration file to a WireGuard interface
  addconf: Appends a configuration file to a WireGuard interface
  syncconf: Synchronizes a configuration file to a WireGuard interface
  genkey: Generates a new private key and writes it to stdout
  genpsk: Generates a new preshared key and writes it to stdout
  pubkey: Reads a private key from stdin and writes a public key to stdout
```

```
# 安装
brew install wireguard-tools
# 创建目录和编辑配置文件
sudo mkdir /usr/local/etc/wireguard/
sudo vim /usr/local/etc/wireguard/wg0.conf

```

内容如下：
```nginxconf
[Interface]
PrivateKey = xxx
Address = 10.0.8.3/24

[Peer]
PublicKey = xxxx
Endpoint = xxx:51820
AllowedIPs = 10.0.8.0/24
```

使用帮助
```
# 启动服务
$ sudo wg-quick up wg0 
# 关闭服务
$ sudo wg-quick down wg0
# 查看WG是否启动
$ sudo wg 
```

## centos 安装 wireguard

参考[官方文档](https://www.wireguard.com/install/)

```
查看版本
cat /etc/*-release

yum install -y epel-release elrepo-release
yum install -y yum-plugin-elrepo
yum install -y kmod-wireguard wireguard-tools
```

参考文章[设置WireGuard ](https://www.myfreax.com/how-to-set-up-wireguard-vpn-on-centos-8/)

```bash
# 生成公钥和私钥
wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey
```

编辑配置文件 `vim /etc/wireguard/wg0.conf`，内如如下：
```
[Interface]
Address = 10.0.8.1/24
SaveConfig = true
ListenPort = 51820
# 上一步生成的私钥
PrivateKey = xxx 
PostUp     = firewall-cmd --zone=public --add-port 51820/udp && firewall-cmd --zone=public --add-masquerade
PostDown   = firewall-cmd --zone=public --remove-port 51820/udp && firewall-cmd --zone=public --remove-masquerade
```

启动
```
# 启动
wg-quick up wg0
#错误提示： RTNETLINK answers: Operation not supported
# Cannot find device "wg0"

# 查看内核版本
uname -r
# 正在运行的内核：kernel-lt-5.4.174

```

需要[升级内核](https://www.cnblogs.com/ding2016/p/10429640.html)，升级到 5.16 解决

```
wg-quick up wg0
# 错误提示： firewallD is not running
# 启动防火墙
systemctl start firewalld
systemctl status firewalld

# 启用ip 转发
# 改配置 net.ipv4.ip_forward = 1
vi /etc/sysctl.d/99-sysctl.conf 
sysctl -p /etc/sysctl.d/99-sysctl.conf

yum install adb
# 添加 peer
wg set wg0 peer MLsqG20kiX7gpvY0D3W4bi/vzmxyFjHVO8zdQco3LV0= allowed-ips 10.0.0.3/24

```


## wireguard 的路由功能
参考[Routing All Your Traffic](https://www.wireguard.com/netns/)

```bash

```

## 关于子网掩码

配置 ip 的时候经常遇到 ip/数字（如 8、16、24、32） 等情况，是什么意思？

如果子网掩码配置错误，有可能将找不到对方。

子网掩码必须和 ip 一同出现，只要配置 ip 的地方，就必须配置子网掩码。

可以单独配置，也可以合并配置。

子网掩码用来表示当前ip的前多少位是网络部分，也可以形象地表示为网络部分有多少个，网络部分之外的部分才是当前子网络。

比如 192.168.1.3 这个 ip，路由器是 192.168.1.1 。
那 192.168.1.0 ~ 192.168.1.255 就是一个子网。

子网掩码就是 255.255.255.0 也就是前三个都是“外网”，只有最后一位才是内网。

用二进制表示就是前 24 位都是 1

所以用 192.168.1.3/24 就可以表示 192.168.1.3 的子网掩码是 255.255.255.0，因此 ip 与子网掩码可简写成“ip/数字”

所以局域网内的子网掩码一般为 24 或 255.255.255.0













参考[教程]()配置安卓端

下载安卓客户端[wireguard](https://f-droid.org/en/packages/com.wireguard.android/)






参考文章
- [WireGuard: How to access a peer’s local network](https://iliasa.eu/wireguard-how-to-access-a-peers-local-network/)
- [wireGuard 安装和配置过程](https://ggqshr.github.io/2020-12-21/wireGuard%E5%AE%89%E8%A3%85%E5%92%8C%E9%85%8D%E7%BD%AE%E8%BF%87%E7%A8%8B/)
- [使用 wireguard 访问公司内网](https://qtdebug.com/mac-vpn-forward/)
- [WireGuard 教程：使用 DNS-SD 进行 NAT-to-NAT 穿透](https://xie.infoq.cn/article/3f68cde0163b359b13fa1a8f0)
- [WireGuard 的工作原理](https://fuckcloudnative.io/posts/wireguard-docs-theory/)
- [使用 WireGuard 无缝接入内网](https://devld.me/2020/07/27/wireguard-setup/)
- [Mac install wireguard ](https://unpc.github.io/2019/02/18/wireguard%20vpn%E5%AE%89%E8%A3%85mac%E5%AE%A2%E6%88%B7%E7%AB%AF/)
- [wireguard](https://www.wireguard.com/install/)
- [mac-wireguard使用](https://ccstudio.com.cn/linux/part3/wg.html)
- [CentOS-7 升级内核](https://zhuanlan.zhihu.com/p/368879345)
- [如何在五分钟内装好 WireGuard](https://cloud.tencent.com/developer/article/1752845)
- [大白话聊 WireGuard](https://no1.engineer/articles/2020-01/simply-talk-about-wireguard)
- [体验Wireguard的简单之美](https://www.nixops.me/articles/wireguard-howtos.html)
- [WireGuard 组建非对称路由](https://www.51cto.com/article/719256.html)
- [WireGuard场景中使用策略路由定义复杂路由](https://blog.imlk.top/posts/policy-routing-with-wg-tunnel/)
- [使用电信 TR069 内网架设 WireGuard 隧道异地组网](https://www.kryii.com/89.html)
- [Tailscale 组网](https://jasper1024.com/jasper/20221211104127/)
- [tailscale 的一些心得](https://blog.laisky.com/p/tailscale/)
