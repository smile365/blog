---
title:  redis-cli
heading:
date: 2020-04-09T05:48:31.427Z
categories: ["code"]
tags: 
description: 只安装redis客户端，不安装redis服务端
---

仅仅安装redis-cli

mac 
```bash
brew tap ringohub/redis-cli
brew update && brew doctor
brew install redis-cli
```

通用平台，[先安装go](http://sxy91.com/posts/golang)

```bash
go get -u -v github.com/holys/redis-cli 
```

linux 自行编译
```bash
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make redis-cli
sudo cp src/redis-cli /usr/local/bin/
```



参考

- (install-redis-cli-only)[https://stackoverflow.com/questions/21795340/linux-install-redis-cli-only]