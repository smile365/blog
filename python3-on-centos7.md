---
title:  centos7快速安装python3
date: 2018-08-14T09:18:01.346Z
tags: ["安装python3","python3安装"]
categories: ["code"]
description: 
---

推荐使用[minicoda](https://www.sxy91.com/posts/miniconda/)，安装更快，更便捷。

下载get-pip:
```shell
curl -O https://bootstrap.pypa.io/get-pip.py
```
> 下载超级慢，再开个shell继续下面的步骤

[参考这里](https://sxy91.com/posts/mongo/)配置centos的镜像源

安装epel源：`yum -y install epel-release`  
安装python3：`yum -y install python34`  

>若出现“Error: Cannot retrieve metalink for repository: epel. Please verify its path and try again” 错误，可运行如下命令。

```bash
sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo
```

配置pip的镜像`mkdir -p ~/.config/pip & vi ~/.config/pip/pip.conf`
```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

下载完get-pip.py后，安装pip：`python3 get-pip.py`
查看当前pip版本:`pip -V` 

> 打个小广告：微信搜索“下课了”，回复“it”，获取30本开发相关的电子书。

参考

- [install-python3](http://ask.xmodulo.com/install-python3-centos.html)
- [pip-mirror](https://pip.pypa.io/en/stable/user_guide/#configuration)
- [pip-command](http://www.cnblogs.com/xueweihan/p/4981704.htm)
