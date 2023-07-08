---
title: install-nodejs
heading:  
date: 2023-02-21T03:09:00.239Z
categories: ["code"]
tags: 
description:  
---

## nodejs 版本选择

[Node.js](https://nodejs.org/zh-cn/) 一般每年会升级两个大版本，偶数版是生产可用的版本（LTS），具体版本生命周期可查看 [nodejs-release](https://github.com/nodejs/release#release-schedule)

mac 或者 windows 建议直接下载 [nodejs 安装包](https://nodejs.org/zh-cn/download/) 进行安装。本教程基于 debian 11 安装。

## 使用 NVM 安装 nodejs
[NVM](https://github.com/nvm-sh/nvm#installing-and-updating)  全名 Node.js Version Management ，顾名思义是一个Node.js 的版本管理工具。
```bash
ls ~/.nvm
# 官方脚本安装，需要自己配置环境变量
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# 自动配置环境变量
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
# -bash: nvm: command not found
# source ~/.bashrc
# 或者重新打开终端

# 使用方式
nvm ls
nvm install node  # 最新版（当前为 19）
nvm install node --lts  # 最新长期支持版（当前为 18）
nvm install 14 # 特定版本
# 安装完默认会使用当前安装的版本
nvm use 14  # 切换版本
```

## 使用 apt 安装 nodejs
推荐使用 nvm 安装 nodejs
```bash
# 安装 nodejs 和 npm/yarn 包管理器
apt update
apt install -y nodejs npm yarn
node -v
# v12.22.12 (2023年)
npm -v
# 7.5.2
yarn --version
# 0.32+git
```

## 配置 npm/yarn 镜像源
nodejs 的 npm 比较慢，可以配置成阿里巴巴的 [npm 镜像](https://npmmirror.com/)
```bash
# 通过 npm 安装 cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
# 使用 cnpm 代替 npm 命令
cnpm install [name]
# 也可以直接执行以下命令，将镜像地址改为淘宝的 npm 镜像地址
npm config set registry https://registry.npm.taobao.org
```

## 使用 nrm/yrm 管理 npm/yarn 镜像源
 [nrm](https://github.com/Pana/nrm) & [yrm](https://github.com/i5ting/yrm)
```bash
npm install -g yrm
yrm ls
yrm use taobao
```



## 遇到的问题 
1. GnuTLS recv error
linux 版本的 NVM 使用 GnuTLS，与 github 的 ssl 版本不兼容，关闭 ssl 即可。
```bash
# GnuTLS recv error (-110): The TLS connection was non-properly terminated.
apt install -y gnutls-bin
git config --global http.sslVerify false
git config --global http.postBuffer 1048576000
```


## 参考文档
- [在 Debian 11 上安装 NVM](https://www.yundongfang.com/Yun75426.html)
- [解决 githubusercontent 443 问题](https://github.com/hawtim/hawtim.github.io/issues/10)
- [GnuTLS recv error (-110) 错误](https://blog.csdn.net/weixin_43108793/article/details/118306045)
- [yarn 修改镜像源](https://juejin.cn/post/6844903889087496200)