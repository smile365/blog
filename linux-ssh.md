---
title:  免密登录Linux主机
date: 2018-07-30T09:19:48.400Z
tags: ["ssh"]
series: ["blog"]
categories: ["code"]
description:
---

每次在终端使用ssh链接服务器都比较繁琐，需要输入账号、密码、端口、域名等一大堆东西。这里提供一种方便的一键连接方式：

假设Linux服务器的ip为：192.168.1.2,ssh端口：3322，以下以mac操作为例。


编辑host
`sudo nano /etc/hosts`
增加如下：
`192.168.1.2 www.sxy91.com www`

测试：`ping www`


使用[ssh-keygen](https://blog.csdn.net/u013227473/article/details/78989041)生成密钥：`ssh-keygen -f ~/.ssh/id_rsa_www`



编辑ssh的config文件：`nano ~/.ssh/config`,内容如下： 
```nginx
Host www
    HostName www.sxy91.com
    User songxueyan
    Port 3322
    IdentityFile ~/.ssh/id_rsa_www
```

复制到Linux
```sh
ssh-copy-id -p 3322 -i ~/.ssh/id_rsa_www.pub  songxueyan@www
```

测试,无须输入端口和密码即可连接成功

```sh
ssh www
```

若仍需输入密码,一般为权限问题。

```sh
ssh -vT www # 打印调试信息，查看Next authentication method: publickey 以后的行。发现有Offering public key，但没有Server accepts key

#登录服务器查看.ssh 目录权限
ls -la ~/ |grep ssh
#drwx------.  2 ssh # 
# 查看sshd日志
tail -f /var/log/secure
# 发现一行Authentication refused: bad ownership or modes for file ～/.ssh/authorized_keys
```

说明：安全起见，sshd强制对key的文件权限进行检查，`.ssh`目录的权限只有自己能读写，keys文件的权限组和其他人只能读。

修改权限

```shell
chmod og-wx ~/.ssh/authorized_keys
chmod og-wx ~/.ssh
chmod og+r ~/.ssh
chmod og+r ~/.ssh/authorized_keys
```

再次测试问题解决


**ssh奇技淫巧**

1、ssh端口转发(隧道)
```
#本机访问server端8080端口如下(s端防火墙只允许localhost访问)：
ssh -L 8080:localhost:8080 sxy@server
```

2、访问server的多个绑定localhost的端口


参考

- [nano编辑器](https://www.vpser.net/manage/nano.html)
- [Mac修改Hosts](https://www.jianshu.com/p/752211238c1b)
- [ssh免密登录远程主机](https://blog.csdn.net/feinifi/article/details/78213297)
- [使用SSH-config文件](http://daemon369.github.io/ssh/2015/03/21/using-ssh-config-file)
- [ssh-keygen参数](https://blog.51cto.com/13691477/2121696)
- [SSH端口转发](https://www.cnblogs.com/520yang/articles/5405323.html)
- [实战SSH端口转发](https://www.ibm.com/developerworks/cn/linux/l-cn-sshforward/)
- [动态端口转发](https://blog.fundebug.com/2017/04/24/ssh-port-forwarding/)
- [password-prompt-with-ssh](https://unix.stackexchange.com/questions/36540/why-am-i-still-getting-a-password-prompt-with-ssh-with-public-key-authentication)
- [无法通过ssh-key 免密登录](https://www.cnblogs.com/marility/p/8400354.html)
- [sshd_config](https://www.ssh.com/ssh/sshd_config/)