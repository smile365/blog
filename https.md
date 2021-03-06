---
title: 申请免费https证书并自动更新 
heading: 申请免费的ssl证书让域名支持https访问并自动更新证书教程方法
tags: ["ssl证书","ssl证书申请","ssl免费证书申请","ssl证书教程","https教程"]
date: 2018-01-30
categories: ["code"]
description:  域名申请ssl证书，申请免费ssl证书后怎么验证域名ssl证书，
---

想给我的域名sxy91.com加https实现域名由http升级为https,找了一圈发现一个免费的ssl证书颁发机构Let's Encrypt。

申请好ssl证书，绑定好自己的域名，这样就可以通过https方式来访问，起到安全的作用。

 [Let's Encrypt](https://letsencrypt.org/) 证书免费，不过每次申请只有90天的有效期，可以通过
 [acme脚本](https://github.com/Neilpang/acme.sh/wiki/Options-and-Params)自动申请证书并定期自动更新。申请步骤如下：


#### 1.安装脚本

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

#### 2.配置nginx

```nginx
# acme.sh 会查找 -d指定的domain
server {
    listen 80;
    server_name www.sxy91.com sxy91.com;
}
```

#### 3.生成证书

```shell
nginx -s stop
acme.sh --issue  -d sxy91.com -d www.sxy91.com --standalone
#会在 "~/.acme.sh/" 目录下生成证书文件
#会自动创建cronjob，每天 0:00 点自动检测所有的证书
crontab -l
```

> 上面的方法是http验证方式，若要使用通配符配置域名，则只能通过[dns模式](https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E)验证。

#### 4.安装证书

```bash
acme.sh --installcert  -d sxy91.com -d www.sxy91.com  \
        --key-file   /etc/nginx/ssl/sxy91.key \
        --fullchain-file /etc/nginx/ssl/sxy91.cer \
        --reloadcmd  "service nginx force-reload"

# 会自动把证书文件复制到"/etc/nginx/ssl"目录下 并改名为sxy91，然后重启nginx。
```

#### 5. 强制使用https访问

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

#### 6. 自动更新

因增nginx加了rewrite强制http跳转到https,acme.sh的自动更新证书无法通过http验证，所以会失败。可以写成一个脚本或用下面的命令。

```bash
yum -y install socat
nginx -s stop
acme.sh --issue -d sxy91.com --standalone -d www.sxy91.com

acme.sh --installcert  -d sxy91.com -d www.sxy91.com  \
        --key-file   /etc/nginx/ssl/sxy91.key \
        --fullchain-file /etc/nginx/ssl/sxy91.cer \
        --reloadcmd  "nginx"
```



生成的四个文件：
 - **<domain>.cer**： 由ca机构签发的域名证书。
 - **<domain>.key**：域名证书的私钥。nginx的ssl_certificate_key参数所用文件。
 - **ca.cer**：  CA证书
 - **fullchain.cer**：链证书，包含域名证书和ca证书。nginx的ssl_certificate参数所用文件。

nginx参数说明：
- **--key-file**：需要把<domain>.key复制到哪里
- **--fullchain-file**：需要把fullchain.cer复制到哪里

#### 7. 错误信息解决

若调试的时候出现：`Create new order error. Le_OrderFinalize not found. `错误，一般是域名没写对，或者解析出错。Let's Encrypt 在有频次限制，如果每个域名、账号在一个小时内触发了 5 次失败的验证，那么就需要等待 1 小时再试。错误信息如下：
```json
{
  "type": "urn:ietf:params:acme:error:rateLimited",
  "detail": "Error creating new order :: too many failed authorizations recently: see https://letsencrypt.org/docs/rate-limits/",
  "status": 429
}
````

**参考**  

- [acme客户端](https://letsencrypt.org/docs/client-options/)
- [SSL/TLS 加密新纪元](https://linux.cn/article-6565-1.html)
- [免费HTTPS证书Let's Encrypt安装教程](https://foofish.net/https-free-for-lets-encrypt.html)
- [acme.sh](https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E)
- [nginx2https](https://tecadmin.net/nginx-force-redirect-to-https-with-www/)
- [nginx-force2https](https://serverfault.com/questions/250476/how-to-force-or-redirect-to-ssl-in-nginx)
- [域名证书-证书密钥-CA证书-](https://community.letsencrypt.org/t/got-4-files-where-to-specify-them/102339)

