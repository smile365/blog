---
title:  ssh-forward
heading: 
date: 2022-07-22T11:53:10.123Z
categories: ["code"]
tags: 
description: 
---


## ssh 端口转发（ssh-forward）

SSH 端口转发，又名 SSH 隧道，用于将应用程序端口从客户端传送到服务器端，反过来也可以。


## 本地转发（ssh -L）



## 远程转发（ssh -R）


默认情况下，OpenSSH 只允许从服务器主机连接到远程转发端口。也就是只监听 host 为 127.0.0.1 和 localhost 的端口。如果想监听主机的 IP 地址端口，可以在 ssh 的  GatewayPorts 服务器配置文件 sshd_config 中修改  GatewayPorts 为 yes  来实现。

```
cat /etc/ssh/sshd_config |grep ^[^#]
ssh 默认关闭了，需要打开，否则无法

GatewayPorts yes
# GatewayPorts clientspecified

```
### 举例

1. macbook 访问内网容器内的 postgresql
```
echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free" > /etc/apt/sources.list
apt update 
apt install ssh
ssh -R 3228:postgresql.middleware.svc:5432 sxy91.com
# ssh -R 3228:postgresql.middleware.svc:5432 root@sxy91.com
# 输入密码
cat /etc/ssh/sshd_config |grep GatewayPorts
# 如果为 no 则无法通过 sxy91.com 的 3228 端口访问 5432
# 也可通过 lsof 查看绑定的 ip
lsof -i:3228 
echo "GatewayPorts yes" >> /etc/ssh/sshd_config
systemctl reload ssh

```



## 动态转发




## 默认转发（./ssh/cnofig）
如果转发的规则比较复杂，或者需要转发多个端口，每次敲击命令都比较麻烦，可以通过 ssh 的配置文件 ./ssh/cnofig 配制好转发规则，下次直接 ssh server 即可。


参考文档 
- [什么是 SSH 端口转发](https://www.ssh.com/academy/ssh/tunneling/example)
- [实战 ssh 转发](https://blog.csdn.net/randyleonard/article/details/9049335)
- [SSH 隧道的反向端口转发](https://zhuanlan.zhihu.com/p/438009437)
- [轻松实现 SSH 反向隧道](https://cloud.tencent.com/developer/article/1528395)
- [SSH 反向代理和端口转发](https://www.jianshu.com/p/dafbbbe4c43b)
- [SSH/OpenSSH/PortForwarding](https://help.ubuntu.com/community/SSH/OpenSSH/PortForwarding)
- [SSH Tunneling (Port Forwarding)](https://linuxize.com/post/how-to-setup-ssh-tunneling/)
- [ssh-port-forwarding](https://phoenixnap.com/kb/ssh-port-forwarding)
