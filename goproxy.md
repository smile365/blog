---
title:  goproxy
date: 2019-07-16T02:09:37.404Z
tags: 
categories:
draft: true
description: 
---

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
chmod +x install.sh  
sudo ./install.sh  
```


### 错误解决
```bash
# 以下两种情况，可能是使用了自动脚本安装，安装的版本不对，应该根据 cpu 型号来手动安装。
-bash: /usr/bin/proxy: cannot execute binary file: Exec format error
/usr/bin/proxy: 1: /usr/bin/proxy: Syntax error: "(" unexpecte

```


参考文档

- [cannot execute binary file](https://my.oschina.net/liting/blog/358502)
