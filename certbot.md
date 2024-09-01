---
title: cerbot-on-debian11
heading: 
date: 2023-05-31
categories: ["code"]
draft: true
tags: 
description: ssl 证书
---

1. 先安装 [openresty](https://gitee.com/smile365/blog/blob/master/openresty.md)

2. 安装 certbot

打开 [certbot](https://certbot.eff.org/instructions?ws=nginx&os=debianbuster) 官网，按照教程安装。

```bash
apt install snapd
snap install core; 
snap refresh core;
apt remove certbot
snap install --classic certbot

certbot --nginx
```