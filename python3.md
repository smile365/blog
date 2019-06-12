---
title:  centos7快速安装python3
date: 2018-08-14T09:18:01.346Z
tags: ["python3"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

下载get-pip:
```shell
curl -O https://bootstrap.pypa.io/get-pip.py
```
> 下载超级慢，再开个shell继续下面的步骤

[参考这里](https://github.com/smile365/blog/blob/master/mongo.md)配置centos的镜像源

安装epel源：`yum -y install epel-release`
安装python3：`yum -y install python34`

配置pip的镜像`mkdir -p ~/.config/pip & vi ~/.config/pip/pip.conf`
```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

下载完get-pip.py后，安装pip：`python3 get-pip.py`
查看当前pip版本:`pip -V` 


参考

- [install-python3](http://ask.xmodulo.com/install-python3-centos.html)
- [pip-mirror](https://pip.pypa.io/en/stable/user_guide/#configuration)
- [pip-command](http://www.cnblogs.com/xueweihan/p/4981704.htm)
