---
title:  nodejs安装教程
heading: 在macos、windows、centos7安装nodejs
date: 2019-12-12T08:55:06.812Z
categories: ["code"]
tags: 
description: 
---

## nodejs 版本选择

nodejs 一般每年会升级两个大版本，偶数版是生产可用的版本（LTS），具体版本生命周期可查看 [nodejs-release](https://github.com/nodejs/release#release-schedule)


## 安装
1. mac 或者 windows 建议直接下载 [nodejs](https://nodejs.org/zh-cn/download/)安装包进行安装。

2. 在 centos7 安装[nodejs](https://nodejs.org/en/download/package-manager/)

先配置安装源[nodejs-yum-source](https://github.com/nodesource/distributions)

```bash
# root 账号
# curl -sL https://rpm.nodesource.com/setup_12.x | bash -
# 非root账号需要sudo权限
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -

#然后安装nodejs
yum install nodejs

#检查Node.js和npm版本
node -v
npm -v
# v12.16.2
# 6.14.4
```

## 更换镜像源
nodejs 的 npm 比较慢，可以配置成阿里巴巴的 [npm镜像](https://npm.taobao.org/)

```bash
# 安装cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
# 使用cnpm代替npm命令
cnpm install [name]
#也可以直接执行以下命令，将镜像地址改为淘宝的npm镜像地址
npm config set registry https://registry.npm.taobao.org
```

