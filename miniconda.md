---
title:  使用Miniconda创建多个python虚拟环境
heading: python虚拟环境
date: 2018-08-20T03:32:41.354Z
tags: ["Miniconda教程","python虚拟环境"]
categories: ["code"] 
---

## 前言
Conda 基于 Python 开发，是一个开源、跨平台、语言无关的包管理与环境管理系统。支持 Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, FORTRAN 等语言。

安装 Conda 比较繁琐，耗时且占用空间很大。Miniconda 比 conda 小，安装更快。使用 miniconda 可创建多个互不影响的 python 虚拟运行环境，且自带 pip。


根据操作系统到[ miniconda 官网](https://docs.conda.io/en/latest/miniconda.html)下载安装脚本，推荐到[清华镜像站](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/)下载。

## macos（intel cpu） 安装

下载 [Miniconda3-latest-MacOSX-x86_64.pkg](https://mirrors.bfsu.edu.cn/anaconda/miniconda/?C=M&O=D)安装即可。

或者使用命令安装（不推荐）：
```bash
curl -LO https://mirrors.bfsu.edu.cn/anaconda/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
sudo /bin/bash ./Miniconda3-latest-MacOSX-x86_64.sh -u
```

## Centos 安装步骤
```shell
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3*.sh
# -p PREFIX: defaults to /root/miniconda3
./Miniconda3*.sh -b -p /opt/conda
# export PATH="/root/miniconda3/bin:$PATH"
```

创建公用的环境变量`vi /etc/profile.d/conda.sh`
```shell
export PATH="/opt/conda/bin:$PATH"
```

重新打开一个终端，测试是否安装成功`which conda`


## 使用 conda 的镜像加速

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

如果不想用镜像，可取消
```
conda config --show channels
conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/  
conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
```

## 创建虚拟环境

```shell
conda create -n py3 python=3
conda env list
source activate py3
```

更多命令请参考[官方文档](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

配置pip镜  
`mkdir ~/.pip && vim ~/.pip/pip.conf`，内容如下：
```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```



参考

- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- [Miniconda镜像](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)
- [getting-started](https://conda.io/docs/user-guide/getting-started.html)
- [Global bash_profile](https://serverfault.com/questions/491585/is-there-a-global-bash-profile-for-all-users-on-a-system)
- [install-conda-for-all](https://stackoverflow.com/questions/27263620/how-to-install-anaconda-python-for-all-users)
- [user-guide](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)