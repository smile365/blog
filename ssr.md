---
title:  ssr
heading:
date: 2020-07-07T05:38:56.953Z
categories: ["code"]
tags: 
description: 
---

#### 安装和配置ssr

安装ssr
```bash
git clone https://github.com/shadowsocksrr/shadowsocksr.git
cd shadowsocksr
vim config.json
```

配置
```json
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "password": "m",
    "method": "aes-128-ctr",
    "protocol": "auth_aes128_md5",
    "protocol_param": "",
    "obfs": "tls1.2_ticket_auth_compatible",
    "obfs_param": "",
    "speed_limit_per_con": 0,
    "speed_limit_per_user": 0,
    "additional_ports" : {}, // only works under multi-user mode
    "additional_ports_only" : false, // only works under multi-user mode
    "timeout": 120,
    "udp_timeout": 60,
    "dns_ipv6": false,
    "connect_verbose_info": 0,
    "redirect": "",
    "fast_open": false
}

```

启动客户端
```bash
cd shadowsocks
python local.py -d start
```

测试是否正常
```bash 
curl --socks5 127.0.0.1:1081 http://httpbin.org/ip
```

#### 安装 Privoxy
Shadowsocks 是一个 socket5 服务，因此我们需要使用 Privoxy 把流量转到 http/https 上。
直接使用yum安装即可：
```bahs
yum install privoxy
# 安装好后，修改一下配置：
vim /etc/privoxy/config
# 搜索forward-socks5t将
forward-socks5t / 127.0.0.1:9050 .
# 取消注释并修改为：
forward-socks5t / 127.0.0.1:1080 .

# 启动 privoxy
privoxy /etc/privoxy/config
# 或以指定用户如www运行privoxy：
privoxy --user www /etc/privoxy/config

# 设置privoxy开机自启
sudo vim /lib/systemd/system/privoxy.service
```

填写如下内容：
```ini
[Unit]
Description=Privoxy Web Proxy With Advanced Filtering Capabilities
Wants=network-online.target
After=network-online.target

[Service]
Type=forking
PIDFile=/run/privoxy.pid
ExecStart=/usr/sbin/privoxy --pidfile /run/privoxy.pid /etc/privoxy/config
```
配置生效：
```bash
systemctl enable /lib/systemd/system/privoxy.service
```

测试是否正常代理了http
```bash
curl -x http://127.0.0.1:8118 http://httpbin.org/ip
```
返回结果:
```json
{
  "origin": "x.x.x.x"
}
```



参考文献：
- [Linux使用SSR客户端](https://mikoto10032.github.io/post/%E7%A8%8B%E5%BA%8F%E5%91%98%E9%82%A3%E4%BA%9B%E4%BA%8B/linux%E4%BD%BF%E7%94%A8ssr%E5%AE%A2%E6%88%B7%E7%AB%AF/)