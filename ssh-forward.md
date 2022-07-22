---
title:  ssh-forward
heading: 
date: 2022-07-22T11:53:10.123Z
categories: ["code"]
tags: 
description: 
---


## ssh 端口转发（ssh-forward）

SSH 端口转发，又名 SSH 隧道，用于将应用程序端口从客户端传送到服务器端，反过来也可以。



## 本地转发（ssh -L）

## 远程转发（ssh -R）


## 默认转发（./ssh/cnofig）
如果转发的规则比较复杂，或者需要转发多个端口，每次敲击命令都比较麻烦，可以通过 ssh 的配置文件 ./ssh/cnofig 配制好转发规则，下次直接 ssh server 即可。





参考文档 
- [什么是 SSH 端口转发](https://www.ssh.com/academy/ssh/tunneling/example)
- 
