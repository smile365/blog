---
title:  wireguard
heading: 
date: 2021-12-16T02:20:30.706Z
categories: ["other"]
tags: 
description: wireguard 内网穿透
---

## mac 安装 WireGuard

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
$ brew install wireguard-tools
# 创建配置目录
$ mkdir /usr/local/etc/wireguard
#
# 创建配置文件
# 配置目录创建完成后，需要自己创建配置文件。配置文件内容就是前面的‘客户端配置文件’
# vi命令使用前面已有介绍，此处不再赘述。
$ vi /usr/local/etc/wireguard/wg0.conf

# 启动服务
$ sudo wg-quick up wg0 
# 关闭服务
$ sudo wg-quick down wg0
# 查看WG是否启动
$ sudo wg
```

mkdir /usr/local/etc/wireguard/
vim /usr/local/etc/wireguard/wg0.conf

```nginxconf
[Interface]
PrivateKey = xxx=
Address = 10.10.10.10/32,fd42:42:42::10/128
DNS = x.x.x.x,x.x.x.x

[Peer]
PublicKey = yyyy=
PresharedKey = zzzz=
Endpoint = mysite.com:51200
AllowedIPs = 0.0.0.0/0,::/0
```




参考文章
- [wireguard内网穿透](https://www.wangairui.com/docs/kaiyuan/kaiyuan-1ctpaoqssmls6)
- [wireGuard安装和配置过程](https://ggqshr.github.io/2020-12-21/wireGuard%E5%AE%89%E8%A3%85%E5%92%8C%E9%85%8D%E7%BD%AE%E8%BF%87%E7%A8%8B/)
- [WireGuard 教程：使用 DNS-SD 进行 NAT-to-NAT 穿透](https://xie.infoq.cn/article/3f68cde0163b359b13fa1a8f0)
- [WireGuard 的工作原理](https://fuckcloudnative.io/posts/wireguard-docs-theory/)
- [使用 WireGuard 无缝接入内网](https://devld.me/2020/07/27/wireguard-setup/)
- [Mac install wireguard ](https://unpc.github.io/2019/02/18/wireguard%20vpn%E5%AE%89%E8%A3%85mac%E5%AE%A2%E6%88%B7%E7%AB%AF/)
- [wireguard](https://www.wireguard.com/install/)
- [mac-wireguard使用](https://unpc.github.io/2019/02/18/wireguard%20vpn%E5%AE%89%E8%A3%85mac%E5%AE%A2%E6%88%B7%E7%AB%AF/)
