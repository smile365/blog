---
title:  免密登录Linux主机
date: 2018-07-30T09:19:48.400Z
tags: ["ssh"]
categories: ["code"]
description:
---

每次在终端使用ssh链接服务器，需要输入账号、密码、端口、域名等一大堆东西，比较繁琐。若不想输入密码端口等信息，可以使用 ssh 密钥方式连接服务器。


假设Linux服务器的ip为：192.168.1.2,ssh端口：3322，以下以mac操作为例。


使用[ssh-keygen](https://blog.csdn.net/u013227473/article/details/78989041)生成密钥：`ssh-keygen -f ~/.ssh/id_rsa_sxy`


把密钥复制到Linux
```sh
ssh-copy-id -p 3322 -i ~/.ssh/id_rsa_sxy.pub  songxueyan@192.168.1.2
```

成功以后即可使用密钥链接服务器

```sh
ssh -i ~/.ssh/id_rsa_sxy -p 3322  songxueyan@192.168.1.2
```

若是从别的地方下载或者拷贝的密钥，链接时可能出现错误：
```
Permissions 0644 for '/Users/songyangcong/.ssh/id_rsa_sxy' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "/Users/songyangcong/.ssh/id_rsa_sxy": bad permissions
songxueyan@192.168.1.2: Permission denied (publickey).
```

意思是权限太大了，私钥只能创建者有读写权限，其他人不可读写。改一下权限即可。
```bash
chmod og-rw ~/.ssh/id_rsa_sxy.pub
```




虽然少了账号密码，但需要指定端口和密钥，能不能一块去掉呢。


先编辑host
`sudo vim /etc/hosts`

绑定一个域名如下：
`192.168.1.2 www.sxy91.com sxy91`

测试：`ping sxy91`

然后编辑ssh的config文件：`vim ~/.ssh/config`,内容如下： 
```nginx
Host sxy91
    HostName www.sxy91.com
    User songxueyan
    Port 3322
    IdentityFile ~/.ssh/id_rsa_sxy
```

此时，无须输入端口和密码即可连接成功

```sh
ssh sxy91
```

若仍需输入密码,一般为权限问题。

```sh
ssh -vT sxy91 # 打印调试信息，查看Next authentication method: publickey 以后的行。
#发现有Offering public key，但没有Server accepts key

#登录服务器查看.ssh 目录权限
ls -la ~/ |grep ssh
#drwx------.  2 ssh # 
# 查看sshd日志
tail -f /var/log/secure
# 发现一行Authentication refused: bad ownership or modes for file ～/.ssh/authorized_keys
```

说明：安全起见，sshd强制对key的文件权限进行检查，`authorized_keys`文件所在的目录（包括上层目录）的权限只有自己能读写，他人和组只能读。

若权限不正确，git或者ssh会出现id_rsa are too open错误如下：
```bash
Permissions 0644 for  are too open. It is required that your private key files are NOT accessible by others. This private key will be ignored.
```

说明：私钥仅能自己读写。公钥其他人只能读。

修改权限

```bash
chmod -R og-wxr ~/.ssh
chmod -R og+r ~/.ssh/*.pub
chmod -R og+r ~/.ssh/config
chmod -R og+r ~/.ssh/known_hosts
```

再次测试问题解决




**ssh奇技淫巧**

1、ssh端口转发(隧道)
```
#本机访问server端8080端口如下(s端防火墙只允许localhost访问)：
ssh -L 8080:localhost:8080 sxy@server
```

2、访问server的多个绑定localhost的端口
```
ssh sxy@server -L 8080:localhost:8080 -L 8088:localhost:8088
```

3、免密转发[ssh_config](https://man.openbsd.org/ssh_config.5)
```
# 把转发规则配置到 ~/.ssh/config

Host tunnel
    HostName database.example.com
    IdentityFile ~/.ssh/coolio.example.key
    User sxy91
    LocalForward 9906 127.0.0.1:3306
    LocalForward 8806 127.0.0.1:8806
```


参考

- [nano编辑器](https://www.vpser.net/manage/nano.html)
- [Mac修改Hosts](https://www.jianshu.com/p/752211238c1b)
- [ssh免密登录远程主机](https://blog.csdn.net/feinifi/article/details/78213297)
- [使用SSH-config文件](http://daemon369.github.io/ssh/2015/03/21/using-ssh-config-file)
- [ssh-keygen参数](https://blog.51cto.com/13691477/2121696)
- [SSH端口转发](https://www.cnblogs.com/520yang/articles/5405323.html)
- [实战SSH端口转发](https://www.ibm.com/developerworks/cn/linux/l-cn-sshforward/)
- [动态端口转发](https://blog.fundebug.com/2017/04/24/ssh-port-forwarding/)
- [ssh服务器添加公钥后仍需要输入密码](https://www.bo56.com/ssh%E5%85%8D%E5%AF%86%E7%A0%81%E7%99%BB%E9%99%86%E8%AE%BE%E7%BD%AE%E6%97%B6authentication-refused-bad-ownership-or-modes%E9%94%99%E8%AF%AF%E8%A7%A3%E5%86%B3%E6%96%B9%E6%B3%95/)
- [SSH-Authentication-Refused](https://www.daveperrett.com/articles/2010/09/14/ssh-authentication-refused/)
- [why-password-prompt-with-ssh-with-public-key](https://unix.stackexchange.com/questions/36540/why-am-i-still-getting-a-password-prompt-with-ssh-with-public-key-authentication)
- [git id_rsa are too open解决方法](https://www.jianshu.com/p/ac1594058493)