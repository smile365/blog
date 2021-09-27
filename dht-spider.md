---
title: dht-spider 
heading: 
date: 2021-09-26T12:52:51.353Z
categories: ["other"]
tags: 
description: 
---

win10新系统(版本号19041)一般自带 wsl，老系统需要自己安装。
安装 [WSL](https://docs.microsoft.com/en-us/windows/wsl/install),以管理员身份打开 PowerShell 并运行：
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

1. 配置 [阿里centos 镜像源](https://developer.aliyun.com/mirror/centos?spm=a2c6h.13651102.0.0.3e221b11t6vpB4)
```bash
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
```

2. 配置 [mongodb源](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
创建配置文件：`vim /etc/yum.repos.d/mongodb-org-5.0.repo` ，内容如下：
```bash
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc

```

参考链接   
- [将互联网上的磁力链接或者BT文件全部采集？](https://www.zhihu.com/question/33094460)
- [实现DHT网络上的种子爬虫](http://chu-studio.com/posts/2021/%E5%AE%9E%E7%8E%B0DHT%E7%BD%91%E7%BB%9C%E4%B8%8A%E7%9A%84%E7%A7%8D%E5%AD%90%E7%88%AC%E8%99%AB)
- [手撕包菜](https://itindex.net/detail/59599-%E7%A3%81%E5%8A%9B-%E6%90%9C%E7%B4%A2-%E7%BD%91%E9%A1%B5)
