---
title:  install acme-sh
heading: install acme-sh
date: 2021-03-17T07:28:17.467Z
categories: ["code"]
tags: 
description: acme.sh 的另类安装方式
---

想使用 let en 生成免费的 https 所需要的 SSL 证书，
由于众所周知的原因，国内安装 acme.sh 奇慢无比，甚至还经常失败，以下是快速的安装方法。

打开此acme.sh脚本文件，并拷贝
```bash

# 需要安装的目录
cd ~
mkdir .acme.sh
cd .acme.sh
vim acme.sh
# 输入 i，然后粘贴刚刚拷贝的脚本内容
# 保存
chmod +x acme.sh
yum install socat # centos
# apt install socat # Ubuntu
# 测试安装
./acme.sh -v
# 创建别名（仅当前回话有用）
alias acme.sh=~/.acme.sh/acme.sh
# 也可以写入到系统环境变量 vim ~/.bash.profile 永久生效
```

剩下的就一样啦，愉快地使用吧

