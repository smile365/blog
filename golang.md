---
title:  golang
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

mac

[下载golang安装包](https://golang.org/dl/)（需要梯子）,或者使用brew
```bash
brew install go
go env -w GOPROXY=https://goproxy.cn,direct
```

参考  

- [install](https://golang.google.cn/doc/install)
- [goproxy.cn](https://github.com/goproxy/goproxy.cn)