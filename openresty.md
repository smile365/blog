---
title: openresty
heading:  
date: 2023-03-10T07:23:59.105Z
categories: ["code"]
tags: 
description:  
---

## 前言

[openresty](https://openresty.org/en/getting-started.html)
 

## 安装 openresty

```bash
apt install -y --no-install-recommends wget gnupg ca-certificates

wget -O - https://openresty.org/package/pubkey.gpg |apt-key add -

codename=`grep -Po 'VERSION="[0-9]+ \(\K[^)]+' /etc/os-release`
echo "deb http://openresty.org/package/debian $codename openresty" \
    |tee /etc/apt/sources.list.d/openresty.list

apt update -y
apt install -y openresty
```

## 配置 openresty
配置 [环境变量](https://openresty.org/en/getting-started.html)
```bash
# 临时环境变量
# PATH=/usr/local/openresty/nginx/sbin:$PATH
# export PATH
# 永久环境变量
echo "PATH=/usr/local/openresty/nginx/sbin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
# 查看版本
nginx -v
# 查看配置文件
nginx -t
#nginx: the configuration file /usr/local/openresty/nginx/conf/nginx.conf syntax is ok
#nginx: configuration file /usr/local/openresty/nginx/conf/nginx.conf test is successful


mkdir -p /usr/local/openresty/nginx/conf/conf.d/
# 备份
mv /usr/local/openresty/nginx/conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf.bak
cat /usr/local/openresty/nginx/conf/nginx.conf.bak | grep -v -E "^$|^\s*#" > /usr/local/openresty/nginx/conf/nginx.conf
# 编辑 /usr/local/openresty/nginx/conf/nginx.conf 在 http 节点下增加
include /usr/local/openresty/nginx/conf/conf.d/*.conf;
cat /usr/local/openresty/nginx/conf/nginx.conf
```


编辑 /usr/local/openresty/nginx/conf/conf.d/test.conf
```nginx
# vi /usr/local/openresty/nginx/conf/conf.d/test.conf
server {
        listen 8080;
        location / {
            default_type text/html;
            content_by_lua_block {
                ngx.say("<p>hello, world</p>")
            }
        }
    }
```

访问测试
```bash
curl localhost:8080
# <p>hello, world</p>
```

## 恢复 nginx 的配置

### http 反向代理
```bash
cp /etc/nginx/conf.d/*.conf /usr/local/openresty/nginx/conf/conf.d/
nginx -t
nginx -s reload
```

### upstream 端口转发
```bash
mkdir -p /usr/local/openresty/nginx/conf/tcp.d/
echo "include /usr/local/openresty/nginx/conf/tcp.d/*.conf;" >> /usr/local/openresty/nginx/conf/nginx.conf
cp /etc/nginx/tcp.d/*.conf /usr/local/openresty/nginx/conf/tcp.d/
nginx -t
nginx -s reload
```
### https 网站 ssl 证书配置
```nginx
# nano /usr/local/openresty/nginx/conf/conf.d/sxy91.com
server {
        listen 443 ssl;
	server_name sxy91.com;
	ssl_certificate /root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/sxy91.com/sxy91.com.crt;
	ssl_certificate_key /root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/sxy91.com/sxy91.com.key;
        location / {
            root /usr/share/www/myblog/public;
        }
    }

server {
        listen 443 ssl;
	server_name www.sxy91.com;
	ssl_certificate /root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/sxy91.com/www.sxy91.com.crt;
	ssl_certificate_key /root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/sxy91.com/www.sxy91.com.key;
        location / {
            root /usr/share/www/myblog/public;
        }
    }
```

## 实战-动态 http 转发
 ip + 端口转发


### 需求
1. 把一个泛域名 `*.km.sxy21.cn` 解析到公网 ip 。
2. 自动实现端口转发，转发到内网网段，网段为 `192.168.0.1xx~192.168.0.199`。
3. `*` 由两部分组成，最多两位数字，加一个字母（不区分大小写，可忽略）。
4. 数字从 0 ~ 99，即 100 个 ip。
5. 字母从 a~z 共计 26 个，代表 26 个端口，人为规定从 10000~10025。
6. 若忽略字母则代表 22 端口。

举例：
1. `ssh 11.km.sxy21.cn` 相当于 `ssh 192.168.0.111`
2. `curl 11a.km.sxy21.cn` 相当于 `curl 192.168.0.111:10000`

这样就实现了动态 ip + 端口转发


### lua 脚本实现的规则如下
```lua
host = "1a.km.sxy21.cn"
print("host:",host)
hostPre = string.match(host, "%d?%d%a?")
print("hostPre:",hostPre)
num = string.match(hostPre, "%d+")
print("num:",num)
ip = "192.168.0." .. (tonumber(num) + 100)
print("ip:",ip)
portStr = string.match(hostPre, "%a+") 
print("portStr:",portStr)
port = 22
if portStr then
  port = string.byte(string.upper(portStr))-65 + 10000
end
print("port:",port)
```


### 用 openresty 实现
server_name set_by_lua  不支持在 stream 模块下使用，stream 为 tcp 协议，没有域名。


1. 创建 stream 配置文件夹
```bash
nginx -V |grep with-stream  # 需要 stream 模块
mkdir -p /usr/local/openresty/nginx/conf/tcp.d/
echo "include /usr/local/openresty/nginx/conf/tcp.d/*.conf;" >> /usr/local/openresty/nginx/conf/nginx.conf
cat /usr/local/openresty/nginx/conf/nginx.conf
```
2. 编辑配置文件
```bash
# vi /usr/local/openresty/nginx/conf/tcp.d/port.conf
stream{
	server {
        listen 8080;
        server_name *.km.sxy21.cn;
        set_by_lua $ip '
                -- host = ngx.req.get_headers()["Host"]
                host = "11a.km.sxy21.cn"
                hostPre = string.match(host, "%d?%d%a?")
                num = string.match(hostPre, "%d+")
                ip = "192.168.0." .. (tonumber(num) + 100)
                ';
        
        set_by_lua $port '
                -- host = ngx.req.get_headers()["Host"]
                host = "11a.km.sxy21.cn"
                hostPre = string.match(host, "%d?%d%a?")
                portStr = string.match(hostPre, "%a+") 
                port = 22
                if portStr then
                  port = string.byte(string.upper(portStr))-65 + 10000
                end
                return port
                ';
        proxy_pass $ip:$port;
    }

}
```



## 参考文档
- [install-openresty-on-debain](https://blog.openresty.com.cn/cn/openresty-pre-built-for-debian-11/)
- [nginx-环境变量](https://www.jianshu.com/p/ac2bc0ad3d74)
- [Nginx + Lua 实战](http://www.sunrisenan.com/docs/nginx/nginx10.html#eds4dw)
- [Lua Ngx API](https://openresty-reference.readthedocs.io/en/latest/Lua_Nginx_API/)
- [lua-demo](https://segmentfault.com/a/1190000039347196)