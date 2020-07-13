---
title:  zmirror
heading:
date: 2020-06-29T01:34:31.411Z
categories: ["code"]
tags: 
description: 
---

使用zmirror实现Twitter的全站镜像

工具
- 一个二级域名，如：twitter.sxy91.com
- nginx
- zmirror
- acme.sh（ssl证书）

```bash
git clone https://github.com/aploium/zmirror.git twitter
cd twitter/
cp more_configs/config_twitter_pc.py config.py
vim config.py
# 修改如下内容
# verbose_level默认为3，会产生非常大量的debug输出
verbose_level = 2
# 配置代理
my_host_name = 'twitter.sxy91.com'
my_host_scheme = 'https://'

is_use_proxy = True
requests_proxies = dict(
	http='socks5:127.0.0.1:1081',
	https='socks5:127.0.0.1:1081'
)

# 配置端口
vim wsgi.py 
## 修改如下内容
application.run(
            port=8092
```

ssl证书参考[免费ssl证书申请教程](https://sxy91.com/posts/https/)

```bash
nginx -s stop
acme.sh --issue -d twitter.sxy91.com --standalone
```

申请好证书以后，配置nginx
```nginx
server {
    listen 80;
    server_name twitter.sxy91.com;
    rewrite ^ https://twitter.sxy91.com$request_uri? permanent;
}

server {
	listen 443 ssl;
	server_name  twitter.sxy91.com;

    ssl_certificate /etc/nginx/pk/twitter.cer;
    ssl_certificate_key /etc/nginx/pk/twitter.key;
    ssl_session_cache    shared:SSL:10m;
    ssl_session_timeout  5m;

	ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers  on;

	location / {
		proxy_pass http://127.0.0.1:8092;
	}
}
```

安装证书
```bash
acme.sh --installcert -d twitter.sxy91.com  \
        --key-file   /etc/nginx/ssl/twitter.key \
        --fullchain-file /etc/nginx/ssl/twitter.cer \
        --reloadcmd  "nginx"
```    

启动
```bash
nohup python wsgi.py 1>twitter.out 2>&1 &
```