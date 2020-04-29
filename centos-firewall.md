---
title:  centos打开内网端口
heading: centos防火墙开启内网所有端口
date: 2020-04-29T06:55:16.688Z
categories: ["code"]
tags: ["centos打开内网端口","firewall-cmd 命令"]
description: 
---


centos防火墙可以通过以下命令打开一个端口
```bash
firewall-cmd --add-port=8080/tcp
```

但如果服务都在内网（局域网），部署了很多服务，一个一个打开很麻烦。可以通过以下命令开放所有内网的链接。类似于打开内容所有端口，这样局域网内的所有服务器都可访问了。

**centos打开内网端口命令：**

```bash
#永久
firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address=192.168.1.0/24 accept'
#非永久
firewall-cmd --add-rich-rule='rule family=ipv4 source address=192.168.1.0/24 accept'
#注意修改成自己的ip段
```

执行之后可以允许内网的任意ip进行访问本机。





