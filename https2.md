---
title:  https2
heading: 
date: 2021-10-26T13:08:39.195Z
categories: ["other"]
tags: 
description: 泛域名https整书申请，通配符https证书申请
---

## 申请证书

参考 acme 的[说明](https://github.com/acmesh-official/acme.sh/wiki/dnsapi#11-use-aliyun-domain-api-to-automatically-issue-cert)，先登录[阿里云](https://ram.console.aliyun.com/manage/ak)帐户以获取的 API 密钥在（配置一个 accesskey）

然后到需要部署整书的服务器执行命令： 
```bash
export Ali_Key="sdfsdfsdfljlbjkljlkjsdfoiwje"
export Ali_Secret="jlsdflanljkljlfdsaklkjflsa"
acme.sh --issue --dns dns_ali -d songxueyan.top -d *.songxueyan.top
```

大概两分钟所有就可以生成，
Ali_Key 和 Ali_Secret 将被保存在 ~/.acme.sh/account.conf 

```
[2021年 10月 26日 星期二 21:29:33 CST] Your cert is in: /root/.acme.sh/songxueyan.top/songxueyan.top.cer
[2021年 10月 26日 星期二 21:29:33 CST] Your cert key is in: /root/.acme.sh/songxueyan.top/songxueyan.top.key
[2021年 10月 26日 星期二 21:29:33 CST] The intermediate CA cert is in: /root/.acme.sh/songxueyan.top/ca.cer
[2021年 10月 26日 星期二 21:29:33 CST] And the full chain certs is there: /root/.acme.sh/songxueyan.top/fullchain.cer
```


## 部署证书

即把整书拷贝到相应目录。
```bash
acme.sh --installcert  -d songxueyan.top -d *.songxueyan.top  \
        --key-file   /etc/nginx/ssl/sxytop.key \
        --fullchain-file /etc/nginx/ssl/sxytop.cer 
```        

