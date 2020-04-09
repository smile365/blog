---
title:  golang简明入门教程
date: 2019-07-26T05:45:19.158Z
tags: 
categories: ["code"]
description: 
---

centos

```bash
yum -y install go
go version
```

mac

[下载golang安装包](https://golang.google.cn/doc/install),或者使用brew
```bash
brew install go
```

配置镜像
```bash
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
```

参考  

- [install](https://golang.google.cn/doc/install)
- [goproxy.cn](https://github.com/goproxy/goproxy.cn)