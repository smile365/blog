---
title:  deepin 深度操作系统配置指南
heading: 
date: 2023-08-25T19:16:05.490Z
categories: ["code"]
tags: 
description: 
---


## 版本信息
- deepin:  20.9

系统自动安装了 ssh（需要启动），xrdp（默认启动）

## 开启 ssh
参考[官方文档](https://wiki.deepin.org/en/System_Management/Service_Management/SSH_service)，注意此系统的 ssh 服务直接叫 ssh 不是 sshd。
```bash
sudo systemctl start ssh
# sudo apt-get install openssh-server
# sudo /etc/init.d/ssh start
```


## 开启远程桌面 xrdp

参考 [xrdp](https://github.com/deepin-community/xrdp)


## 常用软件

### 微信
基于 Windows


## 参考资料

