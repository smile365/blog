---
title: 秒级别安装 acme.sh 获取 ssl 证书的另类方式
heading: 国内快速秒级安装acme.sh
date: 2021-03-17T07:28:17.467Z
categories: ["code"]
tags: 
description: acme.sh 的另类安装方式
---

## 安装
想使用 [acme.sh](https://github.com/acmesh-official/acme.sh/wiki) 生成免费的 https 所需要的 SSL 证书，
```bash
wget -O -  https://get.acme.sh | sh
```

由于众所周知的原因，国内安装 acme.sh 奇慢无比，若安装失败可尝试下面的方法：

首先浏览器打开此[acme.sh脚本](https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh)文件，并拷贝，然后：
```bash
# 进入需要安装的目录
cd ~
mkdir .acme.sh
cd .acme.sh
vim acme.sh
# 输入 i，然后粘贴刚刚拷贝的脚本内容
# 保存
chmod +x acme.sh
yum install socat # centos
# apt install -y socat # Ubuntu
# 测试安装
./acme.sh -v
# 创建别名（仅当前回话有用）
alias acme.sh=~/.acme.sh/acme.sh
# 也可以写入到系统环境变量 vim ~/.bash.profile 永久生效
```

剩下的就一样啦，愉快地使用吧


## 使用

```bash
# apt install -y socat   # 安装依赖
# 注册 zerossl 账号（安装后运行一次即可）
acme.sh  --register-account  -m sxy996@qq.com --server zerossl
# 停止 openresty（nginx）
nginx -s stop
# 申请 ssl 证书
acme.sh --issue -d sxy21.cn --standalone
# 安装证书
acme.sh --install-cert -d sxy21.cn \
--key-file       /etc/nginx/ssl/sxy21.cn.key \
--fullchain-file /etc/nginx/ssl/sxy21.cn.pem
# 检查定时任务
crontab  -l
```


