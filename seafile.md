---
title:  seafile 安装教程
heading: 
date: 2020-03-17T03:32:47.442Z
categories: ["code"]
tags: 
description:  把 seafile 作为私有云盘，自动同步 iphone 或其他 ios 设备的照片
---


## 环境介绍
- macos
- iphone
- linux ：ubuntu 
- seafile： v7
- docker：
-  nginx：



## ubuntu 部署 seafile v9

参考[官方文档](https://docs.seafile.com/published/seafile-manual-cn/docker/%E7%94%A8Docker%E9%83%A8%E7%BD%B2Seafile.md)，使用 docker 方式部署 seafile v7 版本。
编辑好 docker-compose.yaml 文件，然后
```bash
docker-compose up -d
```

## nginx 配置

```nginx
server {
   listen       80;
   listen       443 ssl;
   server_name  seafile.sxy.com;

   ssl_certificate      /etc/nginx/ssl/www.pem;
   ssl_certificate_key  /etc/nginx/ssl/www.key;

   ssl_session_cache    shared:SSL:1m;
   ssl_session_timeout  5m;

   ssl_ciphers  HIGH:!aNULL:!MD5;
   ssl_prefer_server_ciphers  on;
   location / {
       proxy_pass http://10.0.8.3:30180;
   }
}
```








官网：seafile.com
**目录说明**

- conf： 配置文件
- seafile-server：服务器端运行脚本
- seafile-server/seafile.sh： 服务端启动停止
- seafile-server/seahub.sh： web端启动停止
- logs：日志目录（出问题请先检查日志）



**数据库**为mysql:5.7
数据库用户和密码请参考seafile/conf下的`ccnet.conf`、 `seafdav.conf`、`seafile.conf`、`seahub_settings.py`
- ccnet-db: 包含用户和群组信息
- seafile-db: 包含资料库元数据信息
- seahub-db: 包含网站前端（seahub）所用到的数据库表信息



web端默认使用8000端口，使用nginx跳转，nginx配置为：nginx/conf/seafile.conf

```
server {
    listen 80;
    server_name  seafile.sxy91.com;
    proxy_set_header X-Forwarded-For $remote_addr;

    location / {
         proxy_pass         http://127.0.0.1:8000;
         proxy_set_header   Host $host;
         proxy_set_header   X-Real-IP $remote_addr;
         proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
         proxy_set_header   X-Forwarded-Host $server_name;
         proxy_read_timeout  1200s;
         Office Online Server;
         client_max_body_size 0;
    }
    
    location /seafhttp {
        rewrite ^/seafhttp(.*)$ $1 break;
        proxy_pass http://127.0.0.1:8082;
        client_max_body_size 0;
        proxy_connect_timeout  36000s;
        proxy_read_timeout  36000s;
        proxy_send_timeout  36000s;
        send_timeout  36000s;
    }
    location /media {
        root /home/seafile/seafile-server-latest/seahub;
    }

```


