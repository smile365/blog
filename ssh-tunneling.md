---
title:  SSH隧道的使用（内网穿透）
heading: 无需任何软件实现内网穿透
date: 2020-05-20T01:16:16.583Z
categories: ["code"]
tags: ["SSH tunneling"]
description: 
---

情景1：本地直接连接远程服务
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1603532033018.png)

开启隧道后，可通过笔记本 16379 端口访问到 绑定ip为 localhost，端口为 26379 的 redis 服务。
```bash
ssh -L 16379:localhost:26379 sxy91@49.232.54.229
```

然后在笔记本电脑即可连上 服务器的 redis：
```bash
redis-cli -h localhost -p 16379
redis-cli -h 127.0.0.1 -p 16379
redis-cli -h 192.168.1.100 -p 16379
```


情景2：本地直接连接远程服务器的内网服务

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1603532108957.png)


服务器 A 有公网 ip，与服务器 B 部署在同一网段 10.3.1.1 。开启隧道后，可通过笔记本 16379 端口可以访问到绑定ip为 10.3.1.102，端口为 26379 的 redis 服务。

```bash
ssh -L 16379:10.3.1.102:26379 sxy91@49.232.54.229
```

然后在笔记本电脑即可连上 服务器的 redis：
```bash
redis-cli -h localhost -p 16379
redis-cli -h 127.0.0.1 -p 16379
redis-cli -h 192.168.1.100 -p 16379
```

情景3：访问远程的时候相当于访问本地
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1603526127508.png)

```bash
ssh -R 8088:localhost:8080 root@49.232.54.229
```

这样的情景用来调试 web 服务比较多，比如微信公众号开发的时候需要配置一个域名，调试代码的时候，若希望访问这个域名就能访问自己的本机，就可以借助 ssh 反向隧道实现。




情景4：访问远程的时候借助本地访问本地内网

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1603526439703.png)

```bash
ssh -R 8088:192.168.1.99:8080 root@49.232.54.229
```


总结：
情景 1 和情景 2 属于正向 ssh 隧道，情景 3 和情景 4 属于反向 ssh 隧道。即从 ssh 客户端连到 服务端，即是正向。从 ssh 服务端连接到客户端即是反向 ssh 隧道。

