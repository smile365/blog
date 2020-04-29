---
title:  nodejs on mac
heading: 
date: 2019-12-12T08:55:06.812Z
categories: ["life"]
draft: true
tags: 
description: 
---

下载[nodejs](https://nodejs.org/zh-cn/download/)并安装

配置[npm镜像](https://npm.taobao.org/)

在centos7安装[nodejs](https://nodejs.org/en/download/package-manager/)

截止今天（2020年4月29日）推荐多数用户使用的是长期支持版(LTS)12.16.3 

```bash

```



nodejs配置阿里巴巴的npm镜像

```bash
# 安装cnpm
npm install -g cnpm --registry=https://registry.npm.taobao.org
# 使用cnpm代替npm命令
cnpm install [name]
#也可以直接执行以下命令，将镜像地址改为淘宝的npm镜像地址
npm config set registry https://registry.npm.taobao.org
```
