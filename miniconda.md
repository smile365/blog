---
title:  使用Miniconda管理多个Python环境
date: 2018-08-20T03:32:41.354Z
tags: ["python","conda"]
series: ["blog"]
categories: ["code"]
description:
---

根据操作系统下载安装脚本:[miniconda](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/)，centos操作如下：
```shell
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod +x Miniconda3*.sh
./Miniconda3*.sh
# 同意协议
yes
# 默认安装到 ~/miniconda3
# 为所有用户安装，则选择一个其他人可读的目录，如：
/home/sharefile/conda
# 是否加入当前用户的环境变量
no
```

创建公用的环境变量`vi /etc/profile.d/conda.sh`
```shell
export PATH="/home/sharefile/conda/bin:$PATH"
```

**重新打开**shell，测试是否安装成功`which conda`

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
- [Global bash_profile](https://serverfault.com/questions/491585/is-there-a-global-bash-profile-for-all-users-on-a-system)