---
title: 使用 pve 安装 alpine 系统 
heading: 
date: 2022-02-16T03:32:29.694Z
categories: ["code"]
tags: 
description: 
---

## pve 创建虚拟机

下载VIRTUAL 版本下的[ alpine-virt-x86_64.iso](https://alpinelinux.org/downloads/) 镜像文件。

用 pve 创建一个虚拟机，挂载刚刚下载的镜像。（别忘了增加串口0）

![](https://gitee.com/smile365/blogimg/raw/master/小书匠/1644983838329.png)

## 安装

网页上的 console 不方便粘贴复制命令，启动后，在 pve 机器终端用 qm 命令连接 alpine 的终端。然后参考 [安装 alpine 教程](https://zhuanlan.zhihu.com/p/107963371)进行安装，[键盘布局](zh.wikipedia.org/zh-cn/键盘布局#中日韩文字键盘)选择 
```bash
qm terminal 101 -iface serial0
# 回车
setup-alpine
# 键盘布局,几乎都是 QWERTY 布局
Select keyboard layout: [none] us
# 我比较常用 mac 电脑，Windows 的布局直接使用 us
Select variant (or 'abort'): us-mac
# hostname 随意
Enter system hostname (fully qualified form, e.g. 'foo.example.org') [localhost] apline-test
# 时区配置
Which timezone are you in? ('?' for list) [UTC] Asia/Shanghai
# 镜像选择 
Available mirrors:
...
16) mirrors.tuna.tsinghua.edu.cn # 清华
...
57) mirrors.aliyun.com # 阿里云
...

Enter mirror number (1-72) or URL to add (or r/f/e/done) [1] 16
# 参数说明
# r) 从上面的列表中添加随机数
# f) 从上面的列表中检测并添加最快的镜像
# e) 使用文本编辑器编辑 /etc/apk/repositories
# 选择 f 会所有镜像测一遍，比较慢。直接输入 16 或者 57
# 安装到哪个磁盘
Which disk(s) would you like to use? (or '?' for help or 'none') [none] sda
# 安装类型 
How would you like to use it? ('sys', 'data', 'crypt', 'lvm' or '?' for help) [?] sys
# 最后是否格式化 sda 选择 y。否则会安装失败。
WARNING: Erase the above disk(s) and continue? (y/n) [n]  y
# 重启
reboot
```

## 开启启动、换源、root远程访问

如需开机启动，在 pve 的 options 界面中把 start at boot 设置成 yes。 

后期如需更改源，请参考[教程](https://mirrors.tuna.tsinghua.edu.cn/help/alpine/)

```
# 开启 root 用户远程管理
echo "PermitRootLogin  yes" >> /etc/ssh/sshd_config
```

## 修改时区

如果没有在安装是指定时区，可以通过如下方法更改。
```
date
apk add tzdata
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone
apk del tzdata
date
```

## nginx 的安装和使用

nginx 安装和配置
```bash
# 安装 vim、nginx
apk add vim nginx nginx-mod-stream
# 需要手动安装 stream 模块
# 否则报错 nginx: [emerg] unknown directive "stream" in

cd /etc/nginx
# 备份文件
mv nginx.conf nginx.conf.bak
# 方便修改去掉注释行
grep -v "#" nginx.conf.bak > nginx.conf 
# 最后增加一行
mkdir tcp.d
echo "include /etc/nginx/tcp.d/*.conf;" >> nginx.conf 
```

stream 配置 
```bash
# vi tcp.d/pve.conf
# pve.conf
stream{
    upstream pve{
        hash $remote_addr consistent;
        server 	10.0.0.113:8006 max_fails=3 fail_timeout=10s;  
    }
    server{
        listen 8006;
        proxy_connect_timeout 20s;
        proxy_timeout 5m;
        proxy_pass pve;
    }
}
```


http 反向代理配置
```pf.conf
# cat http.d/default.conf
server{
    listen 5000; # dsm
    location / {
            proxy_pass http://10.0.0.117:5000;
    }
}

server{                                          
    listen 9117; # JackettAPI     
    location / {     
            proxy_pass http://10.0.0.117:9117;
    }                               
} 
```

重启 nginx
```bash
nginx -t
nginx -s reload
```

## wireguard 的安装和配置
```
apk add -U wireguard-tools

cd /etc/wireguard && wg genkey | tee privatekey | wg pubkey > publickey
cat /etc/wireguard/publickey 
vi wg0.conf

[Interface]
Address = 10.0.8.2
SaveConfig = true
ListenPort = 49152
PrivateKey = 当前私钥

[Peer]
PublicKey = 公网的公钥
Endpoint = 你的公网:49152
AllowedIPs = 10.0.8.0/24    
# Send periodic keepalives to ensure connection stays up behind NAT.
# 25 秒触发一次
PersistentKeepalive = 25
```


启动 ` wg-quick up wg0 `


## Alpine 中的 systemctl

Alpine 没有 systemctl 之类的工具，相似的工具是 [awall](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-awall-on-alpine-linux/)
```bash
# apk update && apk upgrade
## Install both IPv4 and IPv6 version of IPtables ##
# apk add ip6tables iptables
## Install awall ##
# apk add -u awall
## Verify it ##
# apk version awall
```

让 [wireguard开机启动](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-vpn-server-on-alpine-linux/) 

如果客户端在 NAT 之后，当没有活动的数据连接，客户端就是断开，可通过 配置项 PersistentKeepalive “促活”

或者使用[脚本](https://www.kryii.com/44.html)

vim /etc/local.d/wg.start

wg-quick up wg0

rc-update add wg

wg-quick up wg0    #启动服务端
wg-quick down wg0  #停止服务端


rc-service wg start
rc-service wg stop


配置 nginx udp [端口转发](https://blog.51cto.com/moerjinrong/2287680)


nginx 开机启动
rc-update add nginx
rc-service nginx status
rc-service nginx start



## 参考资料    
- [/run/nginx/nginx.pid](https://stackoverflow.com/questions/65627946/how-to-start-nginx-server-within-alpinelatest-image-using-rc-service-command)
