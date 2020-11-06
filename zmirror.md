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
- python3


需要先安装 Python3 环境，可以参考教程： [Python3 安装教程](https://sxy91.com/posts/python3/)


安装 zmirror 步骤如下：

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
            
# 安装依赖
pip3 install -r requirements.txt 
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



测试启动
```bash
python wsgi.py 
```

在 centos 系统下可能会出现错误： `gcc: error trying to exec 'cc1plus': execvp: 没有那个文件或目录`。

安装c++即可解决：
```bash
yum install gcc-c++
```

正式启动
```bash
nohup python wsgi.py 1>twitter.out 2>&1 &
```

