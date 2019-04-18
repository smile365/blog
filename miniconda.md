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
mkdir /opt/conda
chmod ugo+w /opt/conda
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3*.sh
./Miniconda3*.sh
# 1.同意协议
yes
# 2.输入安装位置
/opt/conda/miniconda3
# 3.是否加入当前用户的环境变量
no
```

创建公用的环境变量`vi /etc/profile.d/conda.sh`
```shell
export PATH="/opt/conda/miniconda3/bin:$PATH"
```

**重新打开一个**终端，测试是否安装成功`which conda`

安装镜像
```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

创建虚拟环境
```shell
conda create -n py3 python=3
source activate py3
```


参考

- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- [Miniconda镜像](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)
- [getting-started](https://conda.io/docs/user-guide/getting-started.html)
- [Global bash_profile](https://serverfault.com/questions/491585/is-there-a-global-bash-profile-for-all-users-on-a-system)
- [install-conda-for-all](https://stackoverflow.com/questions/27263620/how-to-install-anaconda-python-for-all-users)