---
title:  python爬虫使用requests库出现SSLError的错误解决办法
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
```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2020-07-31 17:02:22
# @Author  : songxueyan (sxy9103@gmail.com)
# @Link    : https://sxy91.com
# @Version : $Id$

import ssl
import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.poolmanager import PoolManager
from requests.packages.urllib3.util.ssl_ import create_urllib3_context

CIPHERS = (
    'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+HIGH:'
    'DH+HIGH:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+HIGH:RSA+3DES:!aNULL:'
    '!eNULL:!MD5'
)

class DESAdapter(HTTPAdapter):
    """
    A TransportAdapter that re-enables 3DES support in Requests.
    """
    def create_ssl_context(self):
        #ctx = create_urllib3_context(ciphers=FORCED_CIPHERS)
        ctx = ssl.create_default_context()
        # allow TLS 1.0 and TLS 1.2 and later (disable SSLv3 and SSLv2)
        #ctx.options |= ssl.OP_NO_SSLv2
        #ctx.options |= ssl.OP_NO_SSLv3 
        #ctx.options |= ssl.OP_NO_TLSv1
        ctx.options |= ssl.OP_NO_TLSv1_2
        ctx.options |= ssl.OP_NO_TLSv1_1
        #ctx.options |= ssl.OP_NO_TLSv1_3
        ctx.set_ciphers( CIPHERS )
        #ctx.set_alpn_protocols(['http/1.1', 'spdy/2'])
        return ctx

    def init_poolmanager(self, *args, **kwargs):
        context = create_urllib3_context(ciphers=CIPHERS)
        kwargs['ssl_context'] = self.create_ssl_context()
        return super(DESAdapter, self).init_poolmanager(*args, **kwargs)

    def proxy_manager_for(self, *args, **kwargs):
        context = create_urllib3_context(ciphers=CIPHERS)
        kwargs['ssl_context'] = self.create_ssl_context()
        return super(DESAdapter, self).proxy_manager_for(*args, **kwargs)

ses = requests.session()
url = "https://www.sxy91.com"
ses.mount(url, DESAdapter())
proxies = {}
r = ses.get(url,proxies=proxies)
print(r.text)
```



参考文档:  
- [python-ssl](https://stackoverflow.com/questions/53158229/python-ssl-bad-handshake)
- [requests-tls](https://lukasa.co.uk/2017/02/Configuring_TLS_With_Requests/)
- [sslerrorbad](https://stackoverflow.com/questions/49165989/python-sslerrorbad-handshake-syscallerror-1-unexpected-eof)