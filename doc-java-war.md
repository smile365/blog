---
title:  Java项目部署说明
date: 2018-07-09T05:31:32.925Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

沃德股市
api:https://www.zybuluo.com/songxueyan/note/813160
域名：https://data.stockemotion.com/wodestock
服务名：wodestock 
构建的war包：wodestock.war
服务器：192.168.1.227
上传目录：/home/songxueyan/apache-tomcat-stock/webapps


资讯
api:https://www.zybuluo.com/songxueyan/note/688526
域名：https://news.stockemotion.com/cms
服务名：cms 
构建的war包：cms.war
服务器：192.168.1.118
上传目录：/home/songxueyan/apache-tomcat-cms/webapps

沃币
api:https://www.zybuluo.com/songxueyan/note/775702
域名：https://news.stockemotion.com/wodecoin
服务名：wodecoin 
构建的war包：wodecoin.war
服务器：192.168.1.118
上传目录：/home/songxueyan/apache-tomcat-coin/webapps

热部署方式
先将wodestock.war 上传至
/home/songxueyan
rm -f  apache-tomcat-stock/webapps/wodestock.war
tail -f apache-tomcat-stock/logs/catalina.out
等待出现no function时执行：cp wodestock.war apache-tomcat-stock/webapps/

冷部署方式
./apache-tomcat-stock/bin/catalina.sh stop
rm -rf apache-tomcat-stock/webapps/*
./apache-tomcat-stock/bin/catalina.sh start


调试启动
./apache-tomcat-stock/bin/catalina.sh run

