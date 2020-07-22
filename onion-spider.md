---
title:  暗网爬虫数据抓取-洋葱网络爬虫
heading:
date: 2019-12-19T10:24:00.095Z
draft: true
categories: ["life"]
tags: ["python","onion","proxy","tor","scrapy"]
description: 
---

centos安装tor
```bash
yum -y install tor
#mac brew install tor

# 编辑配置文件
vim  /etc/tor/torrc
```

修改配置文件
```
Socks5Proxy 192.168.159.1:1080 # 使用ss代理连接tor桥
CookieAuthentication 1         # 开启cookies
ControlPort 9051               # 配置通讯端口
```

启动
```bash
systemctl start tor
```


```python
proxies = {'http': 'socks5h://127.0.0.1:9050', 'https': 'socks5h://127.0.0.1:9050'}
not_evil = "http://hss3uro2hsxfogfq.onion/"
data = requests.get(url3,proxies=proxies).text
print(data)
```


参考


- [requests-proxy](https://stackoverflow.com/questions/43682909/connect-to-onion-websites-on-tor-using-python)
- [Centos-7配置与使用SS-tor环境](https://zhizhebuyan.com/2017/07/12/Centos-7%E9%85%8D%E7%BD%AE%E4%B8%8E%E4%BD%BF%E7%94%A8SS-tor%E7%8E%AF%E5%A2%83/)