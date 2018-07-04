---
title: 通过命令安装Shadowsocks Server
tags: ["Shadowsocks"]
date: 2018-07-03
---


根据你的服务器系统选择不同的版本安装[shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev#install-from-repository)

Debian 9 (Stretch) 的安装命令如下：
```shell?linenums
sh -c 'printf "deb http://deb.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list'
apt update
apt -t stretch-backports install shadowsocks-libev
```

配置：
nano /etc/shadowsocks-libev/config.json
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"xxxxx",
    "timeout":60,
    "method":"chacha20-ietf-poly1305"
}

启动
systemctl start shadowsocks-libev  


然后安装客户端


经翻墙成功后，如果是安卓手机推荐安装谷歌play，可以通过谷歌搜索[谷歌服务安装](https://www.google.com/search?newwindow=1&ei=srkfW_mpJ-au0gL39YiQDw&q=%E8%B0%B7%E6%AD%8C%E6%9C%8D%E5%8A%A1%E5%AE%89%E8%A3%85)找到符合自己手机的安装的教程。其实就是安装一套谷歌服务框架，不同手机的安装方法不同。大部分手机可以通过下载一个名叫[谷歌安装器](http://www.wandoujia.com/apps-com.ericxiang.googleinstaller)的app进行安装。

![使用安装器安装谷歌框架](https://i.loli.net/2018/07/04/5b3cb2558ee8a.jpg)
祝你玩的愉快！

参考
[Google服务框架最新版下载](http://www.ifanr.com/app/693456)
[Debian 8 安装 shadowsocks](https://blog.csdn.net/B0rn_T0_W1n/article/details/52663434)

