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




[1]: https://www.silenceboy.com/2025/03/26/%E6%9C%AC%E5%9C%B0%E7%AE%A1%E7%90%86%E5%A4%9A%E4%B8%AApython%E7%89%88%E6%9C%AC/index.html?utm_source=chatgpt.com "本地管理多个python版本 | morty的个人博客"
[2]: https://blog.csdn.net/cnzzs/article/details/145818839?utm_source=chatgpt.com "python多版本环境管理工具有哪些，详细说说适合哪些平台-CSDN博客"
[3]: https://www.cnblogs.com/shenhuanjie/p/18806610/mac-quickly-switch-python-version-11t2wd?utm_source=chatgpt.com "mac 快速切换 python 版本 - SHENHUANJIE - 博客园"
