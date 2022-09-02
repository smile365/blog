---
title:  centos7安装nginx教程
heading:
date: 2020-04-10T03:22:22.943Z
categories: ["code"]
tags: 
description: 
---


参考[官方文档](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)在centos 7 安装 nginx
```bash
yum install nginx -y
nginx -v
nginx
curl -I 127.0.0.1
```

编辑配置文件

```nginx
server {
   listen       80;
   listen       443 ssl;
   server_name  *.sxy21.cn;

   ssl_certificate      /etc/nginx/ssl/www.sxy21.cn.pem;
   ssl_certificate_key  /etc/nginx/ssl/www.sxy21.cn.key;

   ssl_session_cache    shared:SSL:1m;
   ssl_session_timeout  5m;

   ssl_ciphers  HIGH:!aNULL:!MD5;
   ssl_prefer_server_ciphers  on;
   root         /usr/share/nginx/html;
   location / {
       root   html;
       index  index.html index.htm;
   }
}
```