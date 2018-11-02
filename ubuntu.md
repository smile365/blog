---
title:  ubuntu配置
date: 2018-10-11T13:54:06.446Z
tags: ["ubuntu"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---


安装ssh-server服务
```shell
sudo apt-get install openssh-server
```
>如果提示：ubuntu package openssh-server has no installation candidate，则`sudo apt-get update`

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

参考

- [ubuntu开启SSH服务远程登录](https://blog.csdn.net/jackghq/article/details/54974141)
- [ubuntu设置静态IP](https://www.jianshu.com/p/d69a95aa1ed7)
- [ubuntu修改root密码](https://blog.csdn.net/u010002184/article/details/52985645)
- [Ubuntu镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)
- [使用文本用户界面（NMTUI）进行网络配置](https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/7/html/networking_guide/sec-networking_config_using_nmtui)
- [ubuntu修改DNS](https://my.oschina.net/1104290816/blog/804503)