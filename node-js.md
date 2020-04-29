---
title:  nodejs on mac
heading: 
date: 2019-12-12T08:55:06.812Z
categories: ["life"]
draft: true
tags: 
description: 
---

mac 或者windos建议直接下载[nodejs](https://nodejs.org/zh-cn/download/)安装包进行安装。


在centos7安装[nodejs](https://nodejs.org/en/download/package-manager/)

截止今天（2020年4月29日）推荐多数用户使用的是长期支持版(LTS)12.16.3 

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
```


nodejs的npm比较慢，可以配置成阿里巴巴的[npm镜像](https://npm.taobao.org/)

```bash
# 安装cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
# 使用cnpm代替npm命令
cnpm install [name]
#也可以直接执行以下命令，将镜像地址改为淘宝的npm镜像地址
npm config set registry https://registry.npm.taobao.org
```

欢迎加入开发者交流QQ群：334118484。
