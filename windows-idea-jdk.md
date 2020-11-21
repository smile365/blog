---
title:  windows10安装idea和jdk8教程
heading: windows10安装idea和jdk8教程
date: 2020-08-26T04:30:28.225Z
categories: ["code"]
tags: 
description: 
---


[下载jdk8](https://github.com/frekele/oracle-java/releases)

jdk安装路径：C:\Program Files (x86)\Java\1.8.0
jre安装路径：C:\Program Files (x86)\Java\1.8.0\jre

新建系统环境变量

JAVA_HOME: C:\Program Files (x86)\Java\1.8.0

编辑PATH，依次新增两条
- %JAVA_HOME%\bin
- %JAVA_HOME%\jre\bin

> 注：windows10中Path路径中的 %JAVA_HOME%\bin 和 %JAVA_HOME%\jre\bin不要放在同一个行里，末尾不需要符号。

![windows配置系统环境变量](https://gitee.com/smile365/blogimg/raw/master/sxy91/1598418585470.png)

即使配置环境变量之后，若出现“ 'java' 不是内部或外部命令，也不是可运行的程序 或批处理文件。”的错误，是因为win10配置环境变量的时候需要一行一个。
