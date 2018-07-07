---
title:  windows配置ssh key公匙实现免密提交到多个远程仓库
date: 2018-07-07
tags: ["ssh"]
series: ["blog"]
categories: ["code"]
draft: false
description: 
---

查看已经安装的公
C:\Users\[用户]\.ssh

![enter description here](https://i.loli.net/2018/07/07/5b405c72a2c5c.jpg)


或者可以通过git bash 查看：ls ~/.ssh

![enter description here](https://i.loli.net/2018/07/07/5b405ca0bbbfe.jpg)

创建一个github的key

```shell
ssh-keygen -t rsa -f ~/.ssh/id_rsa_github -C "smile645@sina.cn"
```
操作完成后，该目录会多出 id_rsa_github 和 id_rsa_github.pub 两个文件。

编辑config文件，配置不同的仓库指向不同的密钥文件

![enter description here](https://i.loli.net/2018/07/07/5b405e0b253ae.jpg)

在[github](https://github.com/settings/ssh/new)添加刚刚生成的公钥id_rsa_github.pub

![enter description here](https://i.loli.net/2018/07/07/5b405f1dcfeb8.jpg)

使用git bash 测试是否能免密码连接

ssh -T git@github.com

![enter description here](https://i.loli.net/2018/07/07/5b405fc9d9dd5.jpg)

成功！

**参考**

- [Git之同一台电脑连接多个远程仓库](https://www.jianshu.com/p/04e9a885c5c8)
