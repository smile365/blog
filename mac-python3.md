---
title:  mac-python3
heading:  在 macOS 上管理多个 python 环境
date: 2026-03-16T12:50:14.806Z
tags: 
categories: ["other"]
Description:  
---

## 总览

在 **macOS 上管理多个 Python 版本**，常见有 4 种工具。
| 工具                       | 推荐指数  | 适合人群          | 特点                          |
| ------------------------ | ----- | ------------- | --------------------------- |
| **pyenv**                | ⭐⭐⭐⭐⭐ | 普通 Python 开发者 | 最主流、轻量、专门管理 Python          |
| **asdf**                 | ⭐⭐⭐⭐  | 多语言开发者        | 一个工具管理 Python / Node / Ruby |
| **Anaconda / Miniconda** | ⭐⭐⭐⭐  | 数据科学 / AI     | 自带环境和包管理                    |
| **Homebrew**             | ⭐⭐    | 简单需求          | 安装多个版本但切换不方便                |



## 安装

### 1️⃣ 最推荐：pyenv（Python开发首选）

```bash
# 查看系统当前 python 版本
python -V

# 安装 pyenv
brew install pyenv

# 查看可安装的版本 
pyenv install --list | grep -E '^\s*3\.13'

# 用 pyenv 安装 python
pyenv install 3.13.7

# 查看管理的版本
pyenv versions

# 切换版本：全局
pyenv global 3.11.13

# 切换版本：当前项目
pyenv local 3.12.11
# 下次进入项目目录会自动切换。

# 若不生效，可能需要重新加载环境变量
source ~/.bashrc
```


### 2️⃣ 多语言开发推荐：asdf

```bash
brew install asdf
asdf plugin add python
asdf install python 3.10.18
asdf global python 3.10.18
```



### 3️⃣ 数据科学推荐：conda

可以用 Anaconda 或者 Miniconda，它不仅管理 Python，还管理依赖库。

```bash
conda create -n py310 python=3.10
conda activate py310
```




## pyenv 用法


### 查看 pyenv 已安装的 Python 版本

```bash
pyenv versions
```
说明：
* `system` → 系统自带 Python
* `*` → 当前正在使用的版本
* `set by ...` → 当前版本配置来源


### 查看 pyenv 支持安装的 Python 版本

```bash
pyenv install --list
# 会列出所有支持的版本，非常多，900 多行
# 统计版本数量
pyenv install --list | wc -l
```

如果只想看 **Python 3.13、14、15 系列**：

```bash
pyenv install --list | grep -E '^\s*3\.1[345]'
```
正则表达式 `^\s*3\.1[345]` 的解释：
- `^`**`：匹配行的开始。
- `\s*`：匹配零个或多个空白字符（命令 pyenv install --list 输出前面有两个空格缩进）。
- `3\.1`：匹配字面字符串 "3.1"，点号需要转义（不转义代表任意字符）。
- `[345]`：匹配 '3'、'4' 或 '5' 中的任意一个。

输出结果
```bash
pyenv install --list | grep -E '^\s*3\.13'
  3.13.0
  3.13.0t
  3.13-dev
  3.13t-dev
  3.13.1
  3.13.1t
  3.13.2
  3.13.2t
  3.13.3
  3.13.3t
  3.13.4
  3.13.4t
  3.13.5
  3.13.5t
  3.13.6
  3.13.6t
  3.13.7
  3.13.7t
```

`3.13.7t` 中的 `t` 表示 threading experimental build。Python 在 3.13 引入 Global Interpreter Lock 的可选移除版本。


或者去掉空格后再匹配
```bash
pyenv install --list | sed 's/^ *//' | grep '^3.13'
```



### 其他用法
查看帮助
```
pyenv -h
```

查看 pyenv 当前使用的版本

```bash
pyenv version
```

临时改版本（当前 shell）

```bash
pyenv shell 3.9.18
# 关闭终端后恢复。
```


查看当前 Python 来源

```bash
pyenv which python
# /Users/xxx/.pyenv/versions/3.11.9/bin/python
```



卸载某个 Python

```bash
pyenv uninstall 3.10.14
```

更新可安装版本列表

有时 `install --list` 版本比较旧：

```bash
brew update
brew upgrade pyenv
```


### 常用命令速查表

| 功能      | 命令                       |
| ------- | ------------------------ |
| 查看已安装版本 | `pyenv versions`         |
| 查看可安装版本 | `pyenv install --list`   |
| 安装版本    | `pyenv install 3.11.9`   |
| 设置全局版本  | `pyenv global 3.11.9`    |
| 设置项目版本  | `pyenv local 3.11.9`     |
| 临时版本    | `pyenv shell 3.11.9`     |
| 查看当前版本  | `pyenv version`          |
| 删除版本    | `pyenv uninstall 3.11.9` |



## 如何选择 Python 版本



Python 基本是 **一年一个版本节奏**，发布时间几乎固定在每年 10 月。每个版本都有 5 年生命周期。

| 版本   | 发布时间    |
| ---- | ------- |
| 3.10 | 2021-10 |
| 3.11 | 2022-10 |
| 3.12 | 2023-10 |
| 3.13 | 2024-10 |
| 3.14 | 2025-10 |



截至 **2026 年**：

* 最新稳定大版本：**Python 3.14**
* 最近维护版本：**3.14.3（2026-02 发布）

开发中的版本：

* **3.15（开发中）** 预计 **2026-10 发布** 


### 为什么不推荐直接用最新版

因为 **Python 生态兼容性滞后**。

例如，一些库支持版本：
```
numpy
tensorflow
pytorch
scipy
pandas
```
通常需要 **6-12 个月** 才完全支持新版本。所以很多项目会落后 **1 个版本**。


### 实际开发者常用版本
目前最新版： 3.14

- 尝鲜: 最新版的 -1，如 3.13
- 稳定: 最新版的 -2，如 3.12
- 兼容广: 最新版的 -3, 如 3.11

> 永远不要用最新版本,用最新版本的前一个.




## 参考文档

- [PEP 745: Python 3.14 Release Schedule](https://peps.python.org/pep-0745/)
- [Python documentation by version](https://www.python.org/doc/versions/)
- [PEP 790: Python 3.15 Release Schedule](https://peps.python.org/pep-0790/)
- [Anaconda: Python version support](https://www.anaconda.com/docs/reference/policies-practices/python-version-support)
- [本地管理多个 Python 版本 | morty 的个人博客](https://www.silenceboy.com/2025/03/26/%E6%9C%AC%E5%9C%B0%E7%AE%A1%E7%90%86%E5%A4%9A%E4%B8%AApython%E7%89%88%E6%9C%AC/index.html)
- [Python 多版本环境管理工具有哪些 | CSDN](https://blog.csdn.net/cnzzs/article/details/145818839)
- [mac 快速切换 Python 版本 | 博客园](https://www.cnblogs.com/shenhuanjie/p/18806610/mac-quickly-switch-python-version-11t2wd)
