---
title:  storm
date: 2018-08-10T01:43:13.191Z
tags: ["strom"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装的软件列表
- Python:3.4
- pip:18.0
- jdk:1.8
- ZooKeeper:3.4
- Storm:1.2
- Leiningen:2.8
- streamparse:3.13


[参考这里安装Python3](https://github.com/smile365/blog/blob/master/python3.md)


快速安装jdk8
```shell
java -version

su -c "yum install java-1.8.0-openjdk"
```

安装storm，参考[Storm-Installation](https://www.tutorialspoint.com/apache_storm/apache_storm_installation.htm)

安装lien
```
export HTTP_CLIENT="wget --no-check-certificate -O"
```
剩下的参考[leiningen](https://leiningen.org/#install)

安装streamparse
>需要安装gcc和与Python版本对应的dev

```shell
yum install gcc
yum search python3 | grep devel
#我这里安装的是Python版本为3.4
yum install python34-devel
pip3 install streamparse
```

直接使用root账户,需要运行`export LEIN_ROOT=1`


参考
- [Storm-Installation](https://www.tutorialspoint.com/apache_storm/apache_storm_installation.htm)
- [python-storm](https://www.jianshu.com/p/f0c0e53cb7f1)
- [streamparse](http://streamparse.readthedocs.io/en/stable/quickstart.html)
- [Clojars清华大学源](https://my.oschina.net/u/1772293/blog/1813609)
- [leiningen下载失败](https://blog.csdn.net/tonylee0329/article/details/40393059)
- [Storm安装](https://www.codetd.com/article/755024)
- [Lein镜像源](https://www.smitechow.com/2018/02/lein-maven-clojars.html)
- [set-storm-path](https://stackoverflow.com/questions/20793737/how-can-i-add-storm-in-my-path)
- [LEIN_ROOT](https://blog.csdn.net/jiangjingxuan/article/details/54729039)