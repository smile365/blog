---
title:  SSH隧道的使用
heading: 无需任何软件实现内网穿透
date: 2020-05-20T01:16:16.583Z
categories: ["code"]
tags: ["SSH tunneling"]
description: 
---


开发的时候有时候需要访问远程服务器上的某个服务，但是防火墙的关系，不能直接访问某个端口。这时候可以通过ssh搭建一个隧道来达到本地调试的目的。

情景1：服务器的mysql只允许localhost访问，开发测试的时候想通过自己的电脑访问mysql，但由不想打开防火墙。

先建立一个正向的ssh隧道：  
```bash
ssh -L 3306:localhost:3306 root@sxy91.com
```

建立成功后网络请求的转发路径如下：  
![正向](https://gitee.com/smile365/blogimg/raw/master/sxy91/1589938561195.png)

- 第一步：访问本机3306
- 第二步：本机把请求通过ssh发送到sxy91.com这台服务器
- 第三步：sxy91.com这台服务器请求localhost:3306，并把响应结果通过ssh隧道返回给第一步的本机。

情景2：开发微信公众号的时候需要配置一个域名，调试代码的时候能否访问这个域名就能访问自己的本机呢，所谓的微信公众号本地开发。


建立一个反向的ssh隧道：
```bash
ssh -R 8080:localhost:8088 root@sxy91.com:8080
```

- 第一步：访问dev.sxy91.com的8080端口
- 第二步：sxy91.com（linux服务器）把8080端口的请求转发给ssh隧道
- 第三步：ssh隧道把请求继续转发给本机（笔记本电脑），并把响应结果通过ssh隧道返回给sxy91.com的8080端口。


正向即：访问客户端相当于访问服务器
![正向](https://gitee.com/smile365/blogimg/raw/master/sxy91/1589940558174.png)


反向即：访问服务器相当于访问客户端
![反向](https://gitee.com/smile365/blogimg/raw/master/sxy91/1589940591774.png)


