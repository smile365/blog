---
title: openresty
heading:  
date: 2023-03-10T07:23:59.105Z
categories: ["code"]
tags: 
description:  
---

## 前言

[openresty](https://openresty.org/en/getting-started.html) xxx
 

## 安装 openresty

```bash
apt install -y --no-install-recommends wget gnupg ca-certificates

wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

codename=`grep -Po 'VERSION="[0-9]+ \(\K[^)]+' /etc/os-release`
echo "deb http://openresty.org/package/debian $codename openresty" \
    | sudo tee /etc/apt/sources.list.d/openresty.list

apt update -y
apt install -y openresty
```

## 配置 openresty
配置 [环境变量](https://openresty.org/en/getting-started.html)
```bash
PATH=/usr/local/openresty/nginx/sbin:$PATH
export PATH
# 查看版本
nginx -v
# 查看配置文件
nginx -t
#nginx: the configuration file /usr/local/openresty/nginx/conf/nginx.conf syntax is ok
#nginx: configuration file /usr/local/openresty/nginx/conf/nginx.conf test is successful

mkdir -p /usr/local/openresty/nginx/conf/tcp.d/
# 编辑 /usr/local/openresty/nginx/conf/nginx.conf 在 http 节点下增加
include /usr/local/openresty/nginx/conf/tcp.d/*.conf;
cat /usr/local/openresty/nginx/conf/nginx.conf
```


编辑 /usr/local/openresty/nginx/conf/tcp.d/test.conf
```nginx
# vi /usr/local/openresty/nginx/conf/tcp.d/test.conf
server {
        listen 8080;
        location / {
            default_type text/html;
            content_by_lua_block {
                ngx.say("<p>hello, world</p>")
            }
        }
    }
```

访问测试
```bash
curl localhost:8080
# <p>hello, world</p>
```



## 参考文档
- [install-openresty-on-debain](https://blog.openresty.com.cn/cn/openresty-pre-built-for-debian-11/)