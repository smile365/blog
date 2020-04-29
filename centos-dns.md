---
title:  centos dns配置
heading: centos yum时遇到Could not resolve host: mirrors.aliyun.com; 未知的错误 
date: 2020-04-29T07:24:57.231Z
categories: ["code"]
tags: 
description: 
---



使用`yum`命令的时候若出现
```bash
Couldn't resolve host 'mirrors.cloud.aliyuncs.com'、Could not resolve host: mirrors.aliyun.com; 未知的错误、Could not resolve host: mirrors.tuna.tsinghua.edu.cn; 未知的错误等
```

因无法解析域名，需要配置域名解析服务器。

```bash
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```

