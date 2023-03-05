---
title: ubuntu
heading:  ubuntu-22.04 配置开发环境
date: 2023-03-05T02:27:23.262Z
categories: ["code"]
tags: 
description:  ubuntu-22.04.2-desktop-amd64-LTS.iso 
---

## 前言

用 pve 安装了一台 ubuntu 桌面环境，打算用来做开发环境，以下是配置教程。系统版本为 ubuntu-22.04.2-desktop-amd64-LTS.iso 。



## 允许 root 账户 ssh 登录
安装 openssh-server 服务
```shell
apt install -y openssh-server
echo " PermitRootLogin yes" > /etc/ssh/sshd_config
service ssh restart
```

## 开启远程桌面
















安装nmtui
```shell
apt install network-manager
systemclt start NetworkManager
nmtui
```

配置镜像源提示ubuntu could not resolve host，编辑 `vi /etc/resolvconf/resolv.conf.d/base`增加内容如下：
```conf
nameservers 8.8.8.8
# nameservers 114.114.114.114
```
cat 

## 参考文档
- [Ubuntu 20.04 root ssh登录配置](https://www.cnblogs.com/xlizi/p/13553060.html)

- [ubuntu开启SSH服务远程登录](https://blog.csdn.net/jackghq/article/details/54974141)
- [ubuntu设置静态IP](https://www.jianshu.com/p/d69a95aa1ed7)
- [ubuntu修改root密码](https://blog.csdn.net/u010002184/article/details/52985645)
- [Ubuntu镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)
- [使用文本用户界面（NMTUI）进行网络配置](https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/7/html/networking_guide/sec-networking_config_using_nmtui)
- [ubuntu修改DNS](https://my.oschina.net/1104290816/blog/804503)