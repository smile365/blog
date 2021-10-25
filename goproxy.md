---
title: 在树莓派上安装goproxy实现内容穿透和反向代理
date: 2019-07-16T02:09:37.404Z
tags: 
categories: ["code"]
description: 远程控制手机
---

使用 [goproxy](https://github.com/snail007/goproxy/blob/master/README_ZH.md#4%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F 实现树莓派3b的内网穿透。

## 公网服务器安装
64位linux centos
```bash
yum -y install wget
curl -L https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | bash 

```

## 树莓派安装

```bash
# 查看
getconf LONG_BIT
uname
# Linux raspberrypi 5.10.63-v7+ #1457 SMP Tue Sep 28 11:25:31 BST 2021 armv7l GNU/Linux
# 即 32位linux系统，cpu 为 armv7 平台
# 需要手动安装 goproxy
# 请在github的下载链接前面加上: https://mirrors.host900.com/
# 找到 arm-v7 版本并下载
wget https://mirrors.host900.com/https://github.com/snail007/goproxy/releases/download/v11.2/proxy-linux-arm-v7.tar.gz
# 下载自动安装脚本
wget https://mirrors.host900.com/https://raw.githubusercontent.com/snail007/goproxy/master/install.sh  

# 把 F="proxy-linux-amd64.tar.gz" 修改成 F="proxy-linux-arm-v7.tar.gz"
# 否则会提示 cp: cannot stat 'proxy-linux-amd64.tar.gz': No such file or directory
vim install.sh 

chmod +x install.sh  
sudo ./install.sh  
```


### 错误解决
```bash
# 以下两种情况，可能是使用了自动脚本安装，安装的版本不对，应该根据 cpu 型号来手动安装。
-bash: /usr/bin/proxy: cannot execute binary file: Exec format error
/usr/bin/proxy: 1: /usr/bin/proxy: Syntax error: "(" unexpecte

```

## 生成证书


## 内网穿透
多链接版本，对应的子命令是tserver，tclient，tbridge。


需求:
在家里能够通过访问sxy91.com的28080端口访问到树莓派的80端口

步骤:
```
# 1.在公网服务器上执行
proxy bridge -p ":33080" -C proxy.crt -K proxy.key --daemon
proxy server -r ":28080@:8080" -P "127.0.0.1:33080" -C proxy.crt -K proxy.key --daemon 


# 2.在树莓派上执行
# 从服务器拷贝整书
scp user@sxy91.com:/home/goproxy/proxy.* .
# 执行代理
proxy client -P "songxueyan.top:33080" -C proxy.crt -K proxy.key --daemon 

```

nginx 配置

在树莓派上仅安装 adb
```bash
# 安装 adb
sudo apt-get install adb
# 测试是否正常
adb devices
```

开启远程调试
``` bash
1. 手机、树莓派在同一个 wifi下。
2. 使用数据线连接树莓派和手机
3. adb devices 授权
4. 授权成功后切换成网络模式 adb tcpip 5355
5. 手机断开数据线连接，使用网络连接 adb connect 10.0.0.4：5355
6. 测试 adb shell pwd

```

树莓派上安装 nginx
```bash
sudo apt-get install nginx
sudo nginx

```


## 参考文档

