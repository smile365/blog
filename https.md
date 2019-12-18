---
title: 申请免费https证书并自动更新 
tags: 
 - https
 - encrypt
date: 2018-01-30
categories: ["code"]
---

 [Let's Encrypt](https://letsencrypt.org/) 证书免费，不过每次申请只有90天的有效期，可以通过
 [acme脚本](https://github.com/Neilpang/acme.sh/wiki/Options-and-Params)自动申请证书并定期自动更新。申请步骤如下：


### 1.安装脚本

```shell
#创建一个目录存放证书
mkdir -p /etc/nginx/ssl

#安装acme脚本
curl  https://get.acme.sh | sh

#测试安装
acme.sh -v

#如果找不到命令就创建alias
alias acme.sh=~/.acme.sh/acme.sh
```

### 2.配置nginx

```nginx
# acme.sh 会查找 -d指定的domain
server {
    listen 80;
    server_name www.sxy91.com sxy91.com;
}
```

### 3.生成证书

```shell
acme.sh --issue  -d sxy91.com -d www.sxy91.com --nginx
#会在 "~/.acme.sh/" 目录下生成证书文件
#会自动创建cronjob，每天 0:00 点自动检测所有的证书
crontab -l
```

> 上面的方法是http验证方式，若要使用通配符配置域名，则只能通过[dns模式](https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E)验证。


### 4.安装证书

```bash
acme.sh --installcert  -d sxy91.com -d www.sxy91.com  \
        --key-file   /etc/nginx/ssl/sxy91.key \
        --fullchain-file /etc/nginx/ssl/sxy91.cer \
        --reloadcmd  "service nginx force-reload"

# 会自动把证书文件复制到"/etc/nginx/ssl"目录下 并改名为sxy91，然后重启nginx。
```

### 5. 强制使用https访问

配置nginx并强制使用htpps  
```nginx
server {
    listen 80;
    server_name *.sxy91.com;
    rewrite ^ https://sxy91.com$request_uri? permanent;
}

server {
	listen 443 ssl;
	server_name *.sxy91.com;
	ssl_certificate /etc/nginx/ssl/sxy91.cer;
	ssl_certificate_key /etc/nginx/ssl/sxy91.key;
	ssl_session_timeout 5m;
	ssl_session_cache shared:SSL:50m;
	ssl_prefer_server_ciphers on;
}
```

重启nginx  
```shell
nginx -t
nginx -s reload
```

### 6. 自动更新

因增nginx加了rewrite强制http跳转到https,acme.sh的自动更新证书无法通过http验证，所以会失败。可以写成一个脚本或用下面的命令。

```bash
yum -y install socat
nginx -s stop
acme.sh --issue -d sxy91.com --standalone -d www.sxy91.com

acme.sh --installcert  -d sxy91.com -d www.sxy91.com  \
        --key-file   /etc/nginx/ssl/sxy91.key \
        --fullchain-file /etc/nginx/ssl/sxy91.cer \
        --reloadcmd  "nginx -s start"
```


**参考**  

- [acme客户端](https://letsencrypt.org/docs/client-options/)
- [SSL/TLS 加密新纪元](https://linux.cn/article-6565-1.html)
- [免费HTTPS证书Let's Encrypt安装教程](https://foofish.net/https-free-for-lets-encrypt.html)
- [acme.sh](https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E)
- [nginx2https](https://tecadmin.net/nginx-force-redirect-to-https-with-www/)
- [nginx-force2https](https://serverfault.com/questions/250476/how-to-force-or-redirect-to-ssl-in-nginx)

