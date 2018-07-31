---
title:  两台主机免密登录
date: 2018-07-30T09:19:48.400Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

假设Linux的ip为：192.168.1.2
目标：mac免密码登录Linux

编辑host
`sudo nano /etc/hosts`
增加如下：
`192.168.1.2 www.sxy91.com www`

测试
`ping www`

生成密钥
`ssh-keygen -t rsa -f ~/.ssh/id_rsa_www -C "songxueyan@www"`

复制到Linux
`ssh-copy-id -i ~/.ssh/id_rsa_www.pub  songxueyan@www`

参考
- [nano编辑器](https://www.vpser.net/manage/nano.html)
- [Mac修改Hosts](https://www.jianshu.com/p/752211238c1b)
- [ssh免密登录远程主机](https://blog.csdn.net/feinifi/article/details/78213297)