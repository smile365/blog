---
title: 申请免费https证书并自动更新 
tags: ["https"]
date: 2018-01-30
---

 [Let's Encrypt](https://letsencrypt.org/) 证书免费，不过每次申请只有90天的有效期，但可以通过脚本定期更新。申请步骤如下：

**创建验证所需文件**

```shell
#创建一个目录存放证书
mkdir /home/soft/key
cd  /home/soft/key

#创建 Let's Encrypt 账号
openssl genrsa 4096 > account.key

#创建普通域名私钥
openssl genrsa 4096 > domain.key

#创建域名sxy91.com的注册文件
openssl req -new -sha256 -key domain.key -subj "/CN=sxy91.com" > domain.csr

#下载acme脚本
wget https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py

#创建一个目录存放域名验证文件
mkdir -p /var/www/challenges
```


**编辑nginx，让域名能访问到验证文件（需要重启nginx）**
vi /etc/nginx/conf.d/sxy.conf

```nginx
server {
    listen 80;
    server_name *.sxy91.com;
    location ^~ /.well-known/acme-challenge/ {
        alias /var/www/challenges/;
        try_files $uri =404;
    }
}
```

**使用acme脚本申请证书**

    ```shell
    python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/challenges/ > ./signed.crt
    ```

![signed.crt](https://i.loli.net/2018/07/04/5b3cb0f7dc4b5.jpg)


### 

```shell?linenums
wget -O - https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem
nginx -t
nginx -s reload
```

访问[https://sxy91.com](https://sxy91.com)测试

### 过期前自动更新证书
自动更新脚本renew_cert.sh，内容如下：

```shell?linenums
#!/usr/bin/sh renew_cert.sh
python acme_tiny.py --account-key account.key --csr domain.csr --acme-dir /var/www/challenges/ > /tmp/signed.crt || exit
wget -O - https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.pem > intermediate.pem
cat /tmp/signed.crt intermediate.pem > chained.pem
nginx -s reload
```

修改crontab，增加一条定时：
`#每2月执行一次`
`0 0 1 */2 * /home/soft/key/renew_cert.sh 2>> /home/soft/key/acme_tiny.log`

### 参考

- [SSL/TLS 加密新纪元](https://linux.cn/article-6565-1.html)
- [免费HTTPS证书Let's Encrypt安装教程](https://foofish.net/https-free-for-lets-encrypt.html)
- [acme.sh](https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E)

