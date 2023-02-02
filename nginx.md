---
title:  centos7安装nginx教程
heading:
date: 2020-04-10T03:22:22.943Z
categories: ["code"]
tags: 
description: 
---
## 安装 nginx

参考[官方文档](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)在centos 7 安装 nginx
```bash
yum install nginx -y
nginx -v
nginx
curl -I 127.0.0.1
```


## nginx 做静态网页服务器
编辑配置文件 `vi /etc/nginx/nginx.conf`
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

## nginx 做反向代理服务器
```nginx
server {
   listen       80;
   location / {
       proxy_pass 192.168.0.2:8080
   }
   
   location /data/ {
       proxy_pass 192.168.0.3:8080
   }
   
   location /test/ {
       proxy_pass 192.168.0.4:8080/
   }
}
# proxy_pass 中，带'/'表示绝对路径，不带'/'表示相对路径。
# 上面的例子为：
# /data/a.png  --> /data/a.png
# /test/b.png  --> /b.png
```


## nginx 的其他用法
### 端口转发

```bash
nginx -V |grep with-stream  # 需要 stream 模块
# nginx version: nginx/1.20.1
mkdir -p /etc/nginx/tcp.d/
echo "include /etc/nginx/tcp.d/*.conf;" >> /etc/nginx/nginx.conf
vi /etc/nginx/tcp.d/my.conf
```

1. 使用 nginx 做端口转发
```nginx
stream{
    server{
        listen 3222;
        proxy_connect_timeout 20s;
        proxy_timeout 5m;
        proxy_pass 192.168.0.2:22;
    }
}
```

2. 使用 nginx 做批量端口转发，转发端口段，端口范围
```nginx
stream{
   server {
     listen 30100-30200;
     proxy_pass 10.0.8.9:$proxy_port;
   }
}
```

> 注：不能把 $proxy_port 换成 $proxy_port ，否则会出现 nginx: [emerg] unknown "proxy_port" variable


## nginx 升级到最新版
参考[文档](http://nginx.org/en/linux_packages.html#Debian)
```bash
# 安装依赖
apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
# 导入 gpg
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
# 配置软件源
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
# 安装
apt update && apt install -y nginx
```