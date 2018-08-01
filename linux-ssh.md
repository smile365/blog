---
title:  免密登录Linux主机
date: 2018-07-30T09:19:48.400Z
tags: ["ssh"]
series: ["blog"]
categories: ["code"]
description:
---

假设Linux的ip为：192.168.1.2,ssh端口：3322
目标：mac免密码登录Linux

编辑host
`sudo nano /etc/hosts`
增加如下：
`192.168.1.2 www.sxy91.com www`

测试
`ping www`

生成密钥
`ssh-keygen -t rsa -f ~/.ssh/id_rsa_www -C "songxueyan@www"`



编辑ssh的config文件
nano ~/.ssh/config
内容如下：
```nginx
Host www
    HostName www.sxy91.com
    User songxueyan
    Port 3322
    IdentityFile ~/.ssh/id_rsa_www
```

复制到Linux
```shell
ssh-copy-id -p 3322 -i ~/.ssh/id_rsa_www.pub  songxueyan@www
```

测试,无须输入端口和密码即可连接成功
```shell
ssh www
```



参考

- [nano编辑器](https://www.vpser.net/manage/nano.html)
- [Mac修改Hosts](https://www.jianshu.com/p/752211238c1b)
- [ssh免密登录远程主机](https://blog.csdn.net/feinifi/article/details/78213297)
- [使用SSH-config文件](http://daemon369.github.io/ssh/2015/03/21/using-ssh-config-file)