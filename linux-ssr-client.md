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
curl --socks5-hostname 127.0.0.1:1081 https://google.com
```


