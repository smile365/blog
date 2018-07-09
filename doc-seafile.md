---
title:  seafile
date: 2018-07-09T02:48:13.276Z
tags: ["code","it"]
series: ["blog"]
categories: ["交接文档"]
draft: true
description:
---


域名：share.stockemotion.com
服务器：192.168.1.77
官网：[seafile.com](https://www.seafile.com/home/)

![seafile](https://i.loli.net/2018/07/09/5b42d33cef138.jpg)

安装目录：/home/seafile
目录说明
>conf：  配置文件
seafile-server：服务器端运行脚本
seafile-server/seafile.sh： 服务端启动停止
seafile-server/seahub.sh： web端启动停止

数据库为mysql:5.7安装于docker环境 ，ip和端口为192.168.1.77:6306
* ccnet-db: 包含用户和群组信息
* seafile-db: 包含资料库元数据信息
* seahub-db: 包含网站前端（seahub）所用到的数据库表信息

用户和密码请参考/home/seafile/conf：ccnet.conf  seafdav.conf  seafile.conf  seahub_settings.py


 web端默认使用8000端口，使用nginx跳转，nginx配置为：/usr/local/nginx/conf/vhost/seafile.conf
 
 