---
title:  Linux
date: 2018-08-20T05:21:43.768Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

一个命令搞定解压缩  
`ta filename`

centos server启用wifi

```shell
yum install NetworkManager-tui
nmtui
```
如果无法看到WIFI名称  
```shell
yum install NetworkManager-wifi
systemctl restart NetworkManager
```
也可以通过命令行操作
```shell
#查看可用的WiFi网络：
nmcli dev wifi list

#连接到名为TestWifi的wifi网络：
nmcli --ask dev wifi connect TestWifi

```

参考  
- [tar](http://blog.51cto.com/skypegnu1/1745819)
- [how-to-connect-to-wifi-in-centos-7](https://unix.stackexchange.com/questions/370318/how-to-connect-to-wifi-in-centos-7clino-gui?rq=1)
- [](https://unix.stackexchange.com/questions/229711/why-cant-this-centos-7-server-see-wifi-connections)