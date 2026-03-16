---
title:  mac-python3
heading:  在 macOS 上管理多个 python 环境
date: 2026-03-16T12:50:14.806Z
tags: 
categories: ["other"]
Description:  
---

在 **macOS 上管理多个 Python 版本**，常见有 4 种工具。
| 工具                       | 推荐指数  | 适合人群          | 特点                          |
| ------------------------ | ----- | ------------- | --------------------------- |
| **pyenv**                | ⭐⭐⭐⭐⭐ | 普通 Python 开发者 | 最主流、轻量、专门管理 Python          |
| **asdf**                 | ⭐⭐⭐⭐  | 多语言开发者        | 一个工具管理 Python / Node / Ruby |
| **Anaconda / Miniconda** | ⭐⭐⭐⭐  | 数据科学 / AI     | 自带环境和包管理                    |
| **Homebrew**             | ⭐⭐    | 简单需求          | 安装多个版本但切换不方便                |

下面是实际开发中最常见的方案。

---

# 1️⃣ 最推荐：pyenv（Python开发首选）

**优点**

* 安装多个 Python 版本
* 项目自动切换版本
* 不污染系统 Python
* 几乎所有 Python 开发者都在用

pyenv 可以：

* 安装多个 Python
* 设置 **全局版本**
* 设置 **项目版本** ([silenceboy.com][1])

### 安装

```bash
brew install pyenv
```

### 安装 Python

```bash
pyenv install 3.10.14
pyenv install 3.11.9
```

### 切换版本

全局：

```bash
pyenv global 3.11.9
```

当前项目：

```bash
pyenv local 3.10.14
```

进入项目目录会自动切换。

---

# 2️⃣ 多语言开发推荐：asdf

如果你同时开发：

* Python
* Node.js
* Ruby
* Go

推荐用 **asdf**。

优点：

* 一个工具管理所有语言
* 插件架构
* 项目级版本控制 ([CSDN Blog][2])

示例：

```bash
brew install asdf
asdf plugin add python
asdf install python 3.11.9
asdf global python 3.11.9
```

---

# 3️⃣ 数据科学推荐：conda

如果你做：

* AI
* 机器学习
* 数据分析

很多人用：

* Anaconda
* Miniconda

创建环境：

```bash
conda create -n py310 python=3.10
conda activate py310
```

它不仅管理 Python，还管理依赖库。 ([Cnblogs][3])

---



# 一、查看 pyenv 已安装的 Python 版本

```bash
pyenv versions
```

示例输出：

```
system
3.9.18
3.10.14
3.11.9
* 3.12.2 (set by /Users/xxx/.pyenv/version)
```

说明：

* `system` → 系统自带 Python
* `*` → 当前正在使用的版本
* `set by ...` → 当前版本配置来源

---

# 二、查看 pyenv 支持安装的 Python 版本

```bash
pyenv install --list
```

会列出所有支持的版本，例如：

```
3.8.18
3.9.18
3.10.14
3.11.9
3.12.2
3.13-dev
pypy3.10
```

如果只想看 **Python 3.11 系列**：

```bash
pyenv install --list | grep 3.11
```

---

# 三、安装某个 Python 版本

例如安装 Python 3.11：

```bash
pyenv install 3.11.9
```

安装完成后：

```bash
pyenv versions
```

就能看到。

安装路径通常在：

```
~/.pyenv/versions/
```

---

# 四、切换 Python 版本（3种方式）

### 1️⃣ 全局版本（整个系统）

```bash
pyenv global 3.11.9
```

检查：

```bash
python --version
```

---

### 2️⃣ 当前项目版本（推荐）

进入项目目录：

```bash
pyenv local 3.10.14
```

会生成一个文件：

```
.python-version
```

内容：

```
3.10.14
```

进入该目录就自动切换 Python。

---

### 3️⃣ 临时版本（当前 shell）

```bash
pyenv shell 3.9.18
```

关闭终端后恢复。

---

# 五、查看当前 Python 来源

```bash
pyenv which python
```

例如：

```
/Users/xxx/.pyenv/versions/3.11.9/bin/python
```

---

# 六、查看 pyenv 当前使用的版本

```bash
pyenv version
```

输出示例：

```
3.11.9 (set by /Users/xxx/.pyenv/version)
```

---

# 七、卸载某个 Python

```bash
pyenv uninstall 3.10.14
```

---

# 八、更新可安装版本列表

有时 `install --list` 版本比较旧：

```bash
brew update
brew upgrade pyenv
```

---

# 九、常用命令速查表

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

---

💡 **一个很多人不知道但非常好用的命令：**

查看所有 Python 的来源优先级：

```bash
pyenv version-name
```

因为 pyenv 的版本优先级是：

```
shell > local > global > system
```

---

Python 的版本策略其实 **非常规律**，不像很多语言那样混乱。理解它的 **发布周期 + 支持周期** 后，选版本就很简单了。

我给你总结成工程师常用的版本选择逻辑。

---

# 一、Python 的版本更新频率

Python 目前基本遵循：

**每年发布一个大版本（minor version）**

发布时间几乎固定：

```
每年 10 月
```

例如：

| 版本   | 发布时间    |
| ---- | ------- |
| 3.10 | 2021-10 |
| 3.11 | 2022-10 |
| 3.12 | 2023-10 |
| 3.13 | 2024-10 |
| 3.14 | 2025-10 |

所以 Python 基本是 **一年一个版本节奏**。 ([Python Enhancement Proposals (PEPs)][1])

---

# 二、现在的最新版是什么

截至 **2026 年**：

* 最新稳定大版本：**Python 3.14**
* 最近维护版本：**3.14.3（2026-02 发布）** ([Python.org][2])

开发中的版本：

* **3.15（开发中）**
* 预计 **2026-10 发布** ([Python Enhancement Proposals (PEPs)][3])

---

# 三、Python 有没有 “LTS 长期支持版”

Python **没有像 Ubuntu / Node 那种官方 LTS 概念**。

但实际上有 **类似 LTS 的支持周期**：

一个 Python 版本通常支持 **5 年**：

```
前 2 年：Bug + 功能修复
后 3 年：安全更新
```

例如：

| 版本   | 发布   | 支持到  |
| ---- | ---- | ---- |
| 3.14 | 2025 | 2030 |
| 3.13 | 2024 | 2029 |
| 3.12 | 2023 | 2028 |
| 3.11 | 2022 | 2027 |

所以虽然没有 LTS 名字，但实际上 **每个版本都有 5 年生命周期**。 ([Anaconda][4])

---

# 四、为什么很多人不直接用最新版

因为 **Python 生态兼容性滞后**。

例如：

一些库支持版本：

```
numpy
tensorflow
pytorch
scipy
pandas
```

通常需要 **6-12 个月** 才完全支持新版本。

所以很多项目会落后 **1 个版本**。

---

# 五、实际开发者常用版本（2026）

现在主流情况大概是：

| 用途      | 推荐版本            |
| ------- | --------------- |
| 最新开发    | **3.12 / 3.13** |
| AI / 数据 | **3.10 / 3.11** |
| 企业稳定    | **3.11**        |

原因：

* 生态兼容最好
* 工具链稳定

---

# 六、我给你的推荐（很实用）

你是：

* 软件工程师
* macOS + pyenv
* 做开发工具 / AI / 自动化

我建议：

### 首选版本

```
Python 3.12
```

原因：

* 非常稳定
* 生态支持最好
* 未来支持到 **2028**

---

### 想尝鲜

```
Python 3.13
```

性能更好，但部分库可能刚适配。

---

### 我自己的常见配置

很多开发者会这样装：

```bash
pyenv install 3.11
pyenv install 3.12
pyenv install 3.13
```

然后：

```
默认用 3.12
```

项目按需切换。

---

# 七、一个 Python 版本选择口诀

工程师常用规则：

```
永远不要用最新版本
用最新版本的前一个
```

例如现在：

```
最新：3.14
推荐：3.12 / 3.13
```

---


这是一个 **正则 + grep 行首匹配** 的问题，不是 pyenv 的问题。你遇到的现象其实很常见。🙂

---

# 一、为什么 `grep -E ^3` 没有结果

你运行：

```bash
pyenv install --list | grep -E ^3
```

没有结果的原因是：

**`pyenv install --list` 输出前面有空格缩进。**

实际输出是这样的：

```
  3.13.7
  3.13.7t
  3.12.10
```

注意前面有 **两个空格**：

```
␣␣3.13.7
```

而 `^` 表示 **行首**：

```
^3
```

意思是：

```
行首必须直接是 3
```

但实际行首是：

```
空格 空格 3
```

所以匹配不到。

---

# 二、正确写法

### 方法1（推荐）

匹配空格 + 3：

```bash
pyenv install --list | grep -E '^\s*3'
```

解释：

```
^     行首
\s*   任意空格
3     数字3
```

---

### 方法2（简单）

直接找包含：

```bash
pyenv install --list | grep 3.
```

但可能匹配到别的东西。

---

### 方法3（最准确）

只匹配 Python 3.x：

```bash
pyenv install --list | grep -E '^\s*3\.'
```

解释：

```
^\s*3\.
```

匹配：

```
  3.13.7
  3.12.10
  3.11.9
```

不会匹配：

```
pypy3
miniconda3
```

---

# 三、匹配 3.13 版本

如果只想看 **3.13 系列**：

```bash
pyenv install --list | grep -E '^\s*3\.13'
```

输出：

```
  3.13.0
  3.13.1
  3.13.2
  3.13.7
  3.13.7t
```

---

# 四、解释 `3.13.7t` 是什么

`3.13.7t` 是：

**Free-Threaded Python**

Python 在 3.13 引入：

Global Interpreter Lock 的可选移除版本。

`t` 表示：

```
threading experimental build
```

一般 **不要用**：

```
3.13.7
```

就够了。

---

# 五、一个非常好用的小技巧

去掉前面空格：

```bash
pyenv install --list | sed 's/^ *//'
```

再匹配：

```bash
pyenv install --list | sed 's/^ *//' | grep '^3'
```

这样就会正常匹配。

---

# 六、推荐你常用的查询命令

查看所有 Python 3：

```bash
pyenv install --list | grep -E '^\s*3\.'
```

查看 3.13：

```bash
pyenv install --list | grep -E '^\s*3\.13'
```

查看 3.12：

```bash
pyenv install --list | grep -E '^\s*3\.12'
```

---



[1]: https://peps.python.org/pep-0745/?utm_source=chatgpt.com "PEP 745 – Python 3.14 Release Schedule | peps.python.org"
[2]: https://www.python.org/doc/versions/?utm_source=chatgpt.com "Python documentation by version | Python.org"
[3]: https://peps.python.org/pep-0790/?utm_source=chatgpt.com "PEP 790 – Python 3.15 Release Schedule | peps.python.org"
[4]: https://www.anaconda.com/docs/reference/policies-practices/python-version-support?utm_source=chatgpt.com "Python version support - Anaconda"



[1]: https://www.silenceboy.com/2025/03/26/%E6%9C%AC%E5%9C%B0%E7%AE%A1%E7%90%86%E5%A4%9A%E4%B8%AApython%E7%89%88%E6%9C%AC/index.html?utm_source=chatgpt.com "本地管理多个python版本 | morty的个人博客"
[2]: https://blog.csdn.net/cnzzs/article/details/145818839?utm_source=chatgpt.com "python多版本环境管理工具有哪些，详细说说适合哪些平台-CSDN博客"
[3]: https://www.cnblogs.com/shenhuanjie/p/18806610/mac-quickly-switch-python-version-11t2wd?utm_source=chatgpt.com "mac 快速切换 python 版本 - SHENHUANJIE - 博客园"
