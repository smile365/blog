---
title:  pip的安装和镜像的配置
date: 2018-07-26T01:48:58.589Z
tags: 
 - pip
 - mirror
categories: ["code"] 
---



#### 安装pip
若没有pip，下载并安装[get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py)
```shell
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```

若遇到致命错误：Python.h：没有那个文件或目录，需要安装python-devel，如：

```shell
yum install -y python34-devel
```

#### 临时使用

```bash
# 普通安装
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
# 使用requirements.txt安装依赖
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```


#### 默认使用  

配置清华pip镜像作为默认源,修改文件(没有就创建一个): 
- Linux：`~/.config/pip/pip.conf` 
- Windows：`%APPDATA%\pip\pip.ini` 
- macOS：`$HOME/Library/Application Support/pip/pip.conf`

修改 `index-url`至tuna，如下

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

pip 和 pip3 并存时，只需修改一个文件即可` mkdir -p ~/.pip/ && vim ~/.pip/pip.conf`。


参考  
- [get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py)
- [pypi镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)
- [aliases-and-functions](https://ashleynolan.co.uk/blog/beginners-guide-to-terminal-aliases-and-functions)
- [mac下使用alias](https://www.jianshu.com/p/633a30e5d777)
- [install python3-devel](https://stackoverflow.com/questions/43047284/how-to-install-python3-devel-on-red-hat-7)
- [阿里镜像](https://opsx.alibaba.com/mirror)
