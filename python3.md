---
title:  centos7快速安装python3
date: 2018-08-14T09:18:01.346Z
tags: ["python3"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装epel源：`yum install epel-release`
安装python3：`yum install python34`

下载get-pip:
```shell
curl -O https://bootstrap.pypa.io/get-pip.py
```
> 下载超级慢

配置pip的镜像

安装pip`python3 get-pip.py`
查看当前pip版本:`pip -V` 


参考

- [install-python3](http://ask.xmodulo.com/install-python3-centos.html)
- [pip-mirror](https://pip.pypa.io/en/stable/user_guide/#configuration)
- [pip-command](http://www.cnblogs.com/xueweihan/p/4981704.htm)
