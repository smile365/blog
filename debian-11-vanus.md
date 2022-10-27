---
title:  debian-11-vanus
heading:
date: 2022-10-27T07:58:30.901Z
categories: ["code"]
tags: 
description: 
---




## 环境准备
**准备 debian 系统**
1. 使用 pve 的 ct 模板安装一个 debian 11 系统
2. 安装是网络选择 dhcp
3. 开通 root 的 ssh 功能
```bash
echo "PermitRootLogin yes" >>/etc/ssh/sshd_config
/etc/init.d/ssh restart
```
4. 改为[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)
```bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
# echo "">/etc/apt/sources.list
# vi /etc/apt/sources.list
# 内容替换
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free

apt update
```


**准备 k8s**
1. 使用 kubesphere 的 [kk](https://github.com/kubesphere/kubekey/blob/master/README_zh-CN.md) 安装 kubernetes
 ```bash
# 安装依赖
apt install -y sudo curl openssl tar socat conntrack ebtables ipset

# 使用国内网络下载
export KKZONE=cn

# 下载 kk
curl -sfL https://get-kk.kubesphere.io | VERSION=v2.2.2 sh -
# -s 不显示进度信息，silent
# -f 不显示错误信息，fail
# -L 相当于自动 302 跳转，location 

./kk -h
./kk create cluster --with-kubernetes v1.22.10 --with-kubesphere v3.3.0 --container-manager docker -y
# 运行时可选为 docker, crio, containerd and isula
 ```


## 配置 dockerhub 加速器
参考[文档](https://kubesphere.io/zh/docs/v3.3/faq/installation/configure-booster/)


