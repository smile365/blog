---
title:  使用IntelliJ IDEA进行Python远程调试
date: 2018-08-21T02:43:06.074Z
tags: ["idea"]
categories: ["code"]
description: 使用IntelliJ IDEA进行Python远程调试图文配置教程
---

找到部署配置
![enter description here](https://i.loli.net/2018/08/21/5b7b7df73be94.jpg)

点击左上角加号“+”
![enter description here](https://i.loli.net/2018/08/21/5b7b7e31e60bf.jpg)

填写必要信息点击测试，测试通过后在Root pash一栏点击"自动侦测"
![enter description here](https://i.loli.net/2018/08/21/5b7b800324fa0.jpg)

配置本地与远程的路径映射
![enter description here](https://i.loli.net/2018/08/21/5b7b804457401.jpg)

添加一个远程程的sdk

![enter description here](https://i.loli.net/2018/08/21/5b7b82335981b.jpg)


通过SSH配置远程解释器

![enter description here](https://i.loli.net/2018/08/21/5b7b81debd3de.jpg)

选择刚刚已经配置好的服务器

![enter description here](https://i.loli.net/2018/08/21/5b7b831d4d4e2.jpg)

填写python的执行路径及项目的同步目录
![enter description here](https://i.loli.net/2018/08/21/5b7b83f56b82e.jpg)

配置调试的可执行文件
![enter description here](https://i.loli.net/2018/08/21/5b7b84e15aa54.jpg)

最后，检查一下是否勾上自动部署
![enter description here](https://i.loli.net/2018/08/21/5b7b7c411d874.jpg)

参考

- [idea远程调试](http://friskit.me/2014/12/09/python-remote-debug-indellij-idea/)