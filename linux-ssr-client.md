---
title:  linux-ssr-client
heading:
date: 2020-07-31T06:20:45.592Z
categories: ["code"]
tags: 
description: 
---

```bash
wget https://github.com/cndaqiang/shadowsocksr/archive/manyuser.zip
unzip manyuser.zip
cd shadowsocksr-manyuser/
vim config.json 
# 前台启动
python ./shadowsocks/local.py -c config.json 
# 后台启动加参数 start
# python ./shadowsocks/local.py -c config.json start

# curl使用socks5测试
curl --socks5-hostname 127.0.0.1:1081 https://google.com
```

启动后注意查看dns解析是否正确，asyncdns.py默认会读取dns.conf或者/etc/resolv.conf的dns，如果没有会使用[('8.8.4.4', 53), ('8.8.8.8', 53)]，建议配置成8.8.8.8或114.114.114.114。

python的requests库使用proxies测试

```python
socks5_proxies = dict(
	http='socks5:127.0.0.1:1081',
	https='socks5:127.0.0.1:1081'
)
r = requests.get("http://httpbin.org/ip", proxies=socks5_proxies)
print(r.text)
```

如果出现了`Failed to establish a new connection: [Errno -2] Name or service not known'))`错误，原因是数据虽然走了ss代理，但是dns解析还是原来的，可能会遭受dns污染。在/etc/resolv.conf配置一条8.8.8.8的dns解析即可解决。





配置dns

request 