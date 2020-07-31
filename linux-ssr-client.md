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
python ./shadowsocks/local.py -c config.json
# curl使用socks5测试
curl --socks5-hostname 127.0.0.1:1081 https://google.com
```

python的requests库使用proxies测试

```python
socks5_proxies = dict(
	http='socks5:127.0.0.1:1081',
	https='socks5:127.0.0.1:1081'
)
r = requests.get("http://httpbin.org/ip", proxies=socks5_proxies)
print(r.text)
```

配置dns

