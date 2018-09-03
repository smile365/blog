---
title:  Miniconda
date: 2018-08-20T03:32:41.354Z
tags: ["python","conda"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

下载安装脚本到需要安装的目录:[miniconda](https://conda.io/miniconda.html)
```shell
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod +x Miniconda3*.sh
./Miniconda3*.sh
```

重新打开shell，激活conda命令

安装镜像
```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

创建虚拟环境
```shell
conda create -n py35 python=3.5
source activate py35
```

参考

- [Miniconda-install](https://conda.io/docs/user-guide/install/linux.html)
- [Miniconda镜像](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)
- [getting-started](https://conda.io/docs/user-guide/getting-started.html)