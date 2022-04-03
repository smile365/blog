---
title: debian 
heading: 
date: 2022-04-03T08:03:09.764Z
categories: ["other"]
tags: 
description: 
---

## 安装 Debian 系统
CentOS 停止服务后，找了一圈 Linux 发行版。

综合考虑，后期我会主要考虑下面两个发行版： 
- [Debian](https://www.debian.org/releases/stable/amd64/ch03s04.zh-cn.html)，很多 Linux 发行版是基于 Debian 打造的。
- [Ubuntu](https://ubuntu.com/tutorials/install-ubuntu-server#2-requirements)，Ubuntu 是基于 Debian 以桌面应用为主的Linux发行版。

iso 下载地址：
- [ubuntu.iso](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/)
- [debian.iso](https://www.debian.org/distrib/index.zh-cn.html)

下载 debian 的 iso 镜像文件之后，选择图形化安装。

安装[miniconda](https://gitee.com/smile365/blog/blob/master/miniconda.md)

配置镜像源教程 
- [debian](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)
- [docker-ce](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/)


## 安装基础软件 
安装 vim、sudo、rsync docker-ce
```bash
# vim\sudo\rsync
apt install -y vim sudo rsync software-properties-common

# 删掉旧版本 docker
# apt remove docker docker-engine docker.io

# 首先安装依赖:
apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common

# 信任 Docker 的 GPG 公钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# 对于 amd64 架构的计算机，添加软件仓库:
add-apt-repository \
   "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
   $(lsb_release -cs) \
   stable"

# 最后安装
apt update
apt install -y docker-ce
docker -v
```


## 配置数据路径和 Docker 加速器

参考[教程](https://www.runoob.com/docker/docker-mirror-acceleration.html) 配置 dockerhub。

data-root默认为/var/lib/docker，一般分配较小，可改到其他路径。修改daemon配置文件/etc/docker/daemon.json：
```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "data-root": "/home/softdata/docker",
  "registry-mirrors": [
    "https://mirror.ccs.tencentyun.com",
    "https://registry.docker-cn.com",
    "https://dockerhub.azk8s.cn"
  ]
}
EOF
systemctl daemon-reload
systemctl restart docker
```

执行 `docker info`，看到 Registry Mirrors:信息则表示生效

没有安装软件会出现错误：
- debian sudo bash: sudo: command not found
- debian sudo: add-apt-repository: command not found

把普通用户设置成管理员用户
```
su -
usermod -aG sudo YOUR_USERNAME
exit
```


参考文档：
- [centos安装docker](https://gitee.com/smile365/blog/blob/master/docker.md)