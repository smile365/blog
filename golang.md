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

[或者通过压缩包安装](https://golang.google.cn/dl/)  
```bash
# 下载
wget https://golang.google.cn/dl/go1.14.5.linux-amd64.tar.gz
# 解压
tar -C /usr/local -xzf go1.14.5.linux-amd64.tar.gz
# 配置环境变量
vim /etc/profile
# 尾部增加如下内容：
export PATH=$PATH:/usr/local/go/bin
# 重新打开一个shell即可
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

```bash
mkdir test && cd test
go mod init hello

```

在test目录下新建文件`hello.go`
```go
package main

import "github.com/astaxie/beego"

func main() {
    beego.Run()
}
```

运行`go run hello.go`



参考  

- [install](https://golang.google.cn/doc/install)
- [goproxy.cn](https://github.com/goproxy/goproxy.cn)
- [go mod](https://zhuanlan.zhihu.com/p/60703832)