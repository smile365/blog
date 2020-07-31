---
title:  requests-ssl
heading:  python爬虫使用requests库出现SSLError的错误解决办法
date: 2020-07-31T07:47:38.969Z
categories: ["code"]
tags: 
description: 
---


错误信息：
requests/packages/urllib3/contrib/pyopenssl.py  OpenSSL.SSL.SysCallError: (-1, 'Unexpected EOF')

原因:

网站的ssl证书使用了不安全的 3DES Cipher加密方式，主流ssl中间件如OpenSSL删除了对所有使用3DES流密码的密码套件的支持，因此造成依赖openssl的新版本的上层软件会报错。

解决办法




参考文档:  
- [python-ssl](https://stackoverflow.com/questions/53158229/python-ssl-bad-handshake)
- [requests-tls](https://lukasa.co.uk/2017/02/Configuring_TLS_With_Requests/)