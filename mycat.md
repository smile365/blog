---
title: 在CentOS7上安装mycat实现读写分离 
tags: mysql,高可用,读写分离
grammar_cjkRuby: true
---


**安装 jdk**
On the command line, type:
```shell
$ su -c "yum install java-1.8.0-openjdk"
```
The java-1.8.0-openjdk package contains just the Java Runtime Environment. If you want to develop Java programs then install the java-1.8.0-openjdk-devel package.

**安装 mycat**
在[官网](http://mycat.io/)下载相应的版本。
```
wget http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz
tar zxvf Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz
./mycat/bin/mycat console
```

**配置 mycat**



参考
[How to download and install prebuilt OpenJDK packages](http://openjdk.java.net/install/)
[Mycat 实现 MySQL 读写分离](https://www.jianshu.com/p/cb7ec06dae05)
[Mycat安装部署+读写分离](https://segmentfault.com/a/1190000009520414)