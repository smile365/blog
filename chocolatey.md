---
title: chocolatey
heading: 使用choco安装nodejs和yarn并安装GitKraken教程
date: 2021-10-21T03:49:51.046Z
categories: ["code"]
tags: 
description: Windows下 安装yarn，利用chocolatey软件包管理工具，比npm更快更稳定
---


按照[官网文档](https://chocolatey.org/install) 安装 chocolatey 

打开 powershell 输入命令：
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

然后使用 choco 安装 nodejs 和 yarn： 
```bash 
choco install -y nodejs yarn
# 安装完成后重新打开 shell 检测是否安装完成
node -v
yarn -v
```




参考文章:  
- [使用chocolatey安装yarn](https://blog.csdn.net/weixin_42661321/article/details/87887898)
- [GitKraken破解教程](https://www.mengyilingjian-eric.top/index.php/archives/gitkraken.html#)


