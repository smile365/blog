---
title: 最新科学上网教程(2019年11月) 
date: 2019-11-01T03:31:23.730Z
tags: 
categories:
draft: true
description: 
---

防火墙阻断了大多数异常的tcp连接，因此需要新的方式上网了。目前比较可行的是udp/socket/cdn三种方式。本教程使用udp方式，后面更新其他方式。

首选你需要[购买一台在国外的服务器](sxy91.com)。

然后[登录上服务器](sxy91.com)


**需要的工具**

- shadowsocks（服务端+客户端）
- kcptun（服务端+客户端）



**1.服务器端安装shadowsocks**

```bash
# 安装pip，通过pip安装shadowsocks
pip -V
yum -y install wget
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install shadowsocks
```




配置shadowsocks：`vi /etc/shadowsocks.json`    

用[密码生成器](https://suijimimashengcheng.51240.com/)生成一个密码填写在`password`的地方(自己想一个也行)


```json
{
    "server":"0.0.0.0",
    "server_port":50013,
    "local_port":1080,
    "password":"你的shadowsocks密码",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

启动shadowsocks:`nohup ssserver -c /etc/shadowsocks.json >/dev/null 2>&1 &`


**2.服务器端安装kcptun**

安装kcptun

在[kcptun-发布页面](https://github.com/xtaci/kcptun/releases)找到`kcptun-linux-amd64`版本，并复制下载链接。
```shell
# wget +复制的下载链接进行下载。如：
wget https://github.com/xtaci/kcptun/releases/download/v20190924/kcptun-linux-amd64-20190924.tar.gz
# 解压：
tar zxvf kcptun-linux-amd64*.tar.gz
```

配置kcptun：`vi /etc/kcptun/config.json`

用[密码生成器](https://suijimimashengcheng.51240.com/)生成一个密码填写在key的地方(自己想一个也行)

```json
{
    "target":"127.0.0.1:50013",
    "listen":":4000",
    "key":"你的kcptun密码",
}
```

**安卓手机上网方法**

安装shadowsocks和kcptun插件:

到[shadowsocks-android](https://github.com/shadowsocks/shadowsocks-android/releases)页面 下载`shadowsocks--universal.apk
`并安装。

到[kcptun-android](https://github.com/shadowsocks/kcptun-android/releases)页面下载`kcptun--universal.apk`并安装。

配置：

启动shadowsocks点击+号，手动设置。

服务器：你的服务器ip  
远程端口：kcptun.json里配置的`listen`，即4000  
密码：shadowsocks.json里配置的`password`  


点击插件-->kcptun-->配置  
清空所有。填写：`key=你的kcptun密码;`  

保存后启动即可。


**mac电脑上网方法**

到[mac-shadowsocks](https://github.com/shadowsocks/ShadowsocksX-NG/releases)页面下载`ShadowsocksX-NG.zip`,解压后拖到应用里启动。

配置
![enter description here](https://i.loli.net/2019/11/01/P4NG9fS2OgAr1RM.png)



相关教程：

- [如何购买一台服务器并配置好](sxy91.com)
- [如何登录服务器](sxy91.com)
- []()


参考连接






