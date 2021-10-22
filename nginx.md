---
title:  centos7安装nginx教程
heading:
date: 2020-04-10T03:22:22.943Z
categories: ["code"]
tags: 
description: 
---

location /foo {
  proxy_pass http://localhost:3200/;
}
请注意指令/末尾的附加内容proxy_pass。NGINX 将去除匹配的前缀/foo并将剩余部分传递给 URI 处的后端服务器/。因此，http://myserver:80/foo/bar将在http://localhost:3200/bar.

| location | proxy_pass | 正向路径 | 反向路径 |     |     |
| -------- | ---------- | -------- | -------- | --- | --- |
| /foo     |            | /foo     | /foo     |     |     |
| /foo     | /          | /foo/bar | /bar     |     |     |
|          |            |          |          |     |     |
|          |            |          |          |     |     |


参考文档 
- [URL重写介绍](https://www.cnblogs.com/Nicholas0707/p/12210551.html)