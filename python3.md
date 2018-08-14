---
title:  centos7快速安装python3
date: 2018-08-14T09:18:01.346Z
tags: ["python3"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---


yum install python34 #安装  >如果提示没有可用的Python34 则安装epel源： yum install epel-release

pip -V #查看当前pip版本

curl -O https://bootstrap.pypa.io/get-pip.py #下载pip安装脚本 。ps：考验网速的时刻到了，太慢的话去喝杯咖啡。
 python3 get-pip.py #使用Python3 安装pip，
 pip -V #查看当前pip版本



参考

- [install-python3](http://ask.xmodulo.com/install-python3-centos.html)
- [pip-mirror](https://pip.pypa.io/en/stable/user_guide/#configuration)
- [pip-command](http://www.cnblogs.com/xueweihan/p/4981704.htm)

