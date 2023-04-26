---
title:  mac-python3
heading:  
date: 2023-02-02T12:50:14.806Z
tags: 
categories: ["other"]
Description:  
---

## 配置
- 硬件：MacBook air 2022 m2 24G+512G
- os：13.2.1


## 安装 python3 
1. 安装
从 [python 官网](https://www.python.org/downloads/macos/) 下载 .pkg 文件安装。

2. 配置环境变量
```bash
where python3
where pip3
```


## 安装 pip

使用 pkg 安装包安装完后会自动安装 pip3

## 配置 pip 镜像 

修改 `index-url`至 tuna
```
mkdir -p ~/.pip/
vi ~/.pip/pip.conf
```

`~/.pip/pip.conf` 内容如下：
```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```


