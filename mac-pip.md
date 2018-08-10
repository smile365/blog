---
title:  pip配置国内镜像源
date: 2018-07-26T01:48:58.589Z
tags: ["pip"]
series: ["blog"]
categories: ["code"]
description:
---

pypi 镜像使用帮助
pypi 镜像每 5 分钟同步一次。

临时使用
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
注意，simple 不能少, 是 https 而不是 http

设为默认
修改 `~/.config/pip/pip.conf` (Linux), `%APPDATA%\pip\pip.ini` (Windows 10) 或 `$HOME/Library/Application Support/pip/pip.conf` (macOS) (没有就创建一个)， 修改 `index-url`至tuna，例如

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```
pip 和 pip3 并存时，` ~/.pip/pip.conf`。


如果你不想更改匹配配置文件，也可以通过写个命令别名替代。

mac的aliase不支持参数，可以通过function来达到目的。

vim ~/.aliases.sh
```
function pip(){
    if test "$1" = "install";then
        pip2 "$@" -i https://pypi.tuna.tsinghua.edu.cn/simple
    else
        pip2 "$@"
    fi
}
```
然后vim ~/.bash_profile,最后一行加入。
source "/Users/frankchow/.aliases.sh"

以后输入`pip2 install xxx `就是通过镜像下载。

参考
- [aliases-and-functions](https://ashleynolan.co.uk/blog/beginners-guide-to-terminal-aliases-and-functions)
- [mac下使用alias](https://www.jianshu.com/p/633a30e5d777)
- [pypi 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)