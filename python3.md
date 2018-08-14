---
title:  centos7安装python3
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


参考文档： 
Install Python3 from EPEL Repository ：http://ask.xmodulo.com/install-python3-centos.html
使用IUS源安装Python3.6
2. ln命令 
3. How to install Python3 on CentOS 
4. CentOS 7 安装 Python3.5
pip 常用命令 http://www.cnblogs.com/xueweihan/p/4981704.html