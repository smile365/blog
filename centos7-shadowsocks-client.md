---
title:  Linux安装shadowsocks客户端教程
heading: 2020年Linux环境centos7安装shadowsocks-client客户端教程方法
date: 2020-07-07T02:42:23.828Z
categories: ["code"]
tags: ["CentOS科学上网","shadowsocks-libev"]
description: Linux安装shadowsocks和shadowsocks-libev
---

本篇文章为客户端安装和配置教程，CentOS安装和配置shadowsocks服务端请参考另外的[教程]()

可使用pip直接安装，安装完成后有客户端和服务端启动命令。
```bash
yum install python-pip
pip install shadowsocks
```

若需要使用`aes-256-gcm`加密算法，推荐从github下载Shadowsocks的最新版安装，命令如下：
```
# 安装依赖
yum install epel-release python-pip libsodium
# 也可以直接下载压缩包到本地安装
pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
```

查看shadowsocks版本的命令
```bash
# 服务端版本
ssserver --version
# 客户端版本
sslocal --version
```


配置客户端
创建并编辑文件
```bahs
vi /etc/shadowsocks.json
```

内容如下: 
```bash
{
  "server":"x.x.x.x",             #你的 ss 服务器 ip
  "server_port":1053,                #你的 ss 服务器端口
  "local_address": "127.0.0.1",   #本地ip
  "local_port":1080,                 #本地端口
  "password":"password",          #连接 ss 密码
  "timeout":300,                  #等待超时
  "method":"aes-256-cfb",         #加密方式
  "workers": 1                    #工作线程数
}
```

若出现`ERROR    libsodium not found`错误，则是因为部分算法需要libsodium支持，可以通过yum安装libsodium:  
```bash
yum install -y libsodium libsodium-devel
```


CentOS 7 shadowsocks 开机 启动