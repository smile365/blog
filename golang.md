---
title:  golan
date: 2019-07-26T05:45:19.158Z
tags: 
categories:
draft: true
description: 
---

centos

```bash
yum -y install go
go version
go env -w GOPROXY=https://goproxy.cn,direct
```

参考  

- [install](https://golang.google.cn/doc/install)
- [goproxy.cn](https://github.com/goproxy/goproxy.cn)