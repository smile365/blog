---
title: "minikube 单机版 k8s"
heading: 
date: 2022-11-01T01:46:04.738Z
categories: ["code"]
tags: 
description: 
---
## 前言
minikube 单机版 k8s

## 环境说明
- 阿里云 ECS 2 cpu 4GB 20GB
- debian 11（bullseye）


## 所需工具
- [Docker](https://docs.docker.com/engine/install/debian/)，虚拟容器管理器
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-other-package-management)，
- minikube，可以理解为单机版的 Kubernete 。

可提前下载 kubectl 和 minikube
```bash
# 下载 kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# 下载 minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

## 使用阿里云源
参考 [阿里文档](https://developer.aliyun.com/mirror/debian/)，
```
检查是否使用了阿里云的源
cat /etc/apt/sources.list 
# 如果不是，可自行添加下面的内容到 /etc/apt/sources.list 最前面
deb https://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb https://mirrors.aliyun.com/debian-security/ bullseye-security main
deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main
deb https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib
deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib

# 更新
apt update
```


## 安装 docker

### 方法一：使用脚本安装
使用[脚本安装](https://docs.docker.com/engine/install/debian/#install-using-the-convenience-script)最方便
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sudo sh ./get-docker.sh
```


### 方法二：手动安装

1. 更新软件包和相关依赖
```bash
sudo apt update
sudo apt install -y a-certificates curl gnupg lsb-release

```
2. 添加 Docker 的 存储库
```bash

sudo mkdir -p /etc/apt/keyrings
# 添加 Docker 的官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 设置存储库
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 配置 dockerhub 加速器
```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://yourxxx.mirror.aliyuncs.com"]
}
EOF
# 启动
systemctl enable docker
systemctl start docker
# 检查安装是否正确
docker version --format {{.Server.Version}} # 20.10.21
# docker info --format {{.CgroupDriver}} # systemd
# docker info --format '{{.OSType}}'  # linux
docker info --format '{{.RegistryConfig.Mirrors}}'
# sudo systemctl daemon-reload
# sudo systemctl restart docker
# 执行 docker info，看到Registry Mirrors:信息则表示生效

```

## 安装 kubectl

1. 安装 [snap](https://computingforgeeks.com/run-kubernetes-on-debian-11-with-minikube/)
```bash
sudo -i
apt update

apt install -y snapd

sudo ln -s /var/lib/snapd/snap /snap
echo 'export PATH=$PATH:/var/lib/snapd/snap/bin' | sudo tee -a /etc/profile.d/snap.sh

sudo systemctl enable --now snapd.service snapd.socket

```

2. 使用 [snap](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-other-package-management)kubectl
```bash
snap install kubectl --classic
kubectl version --client
# 如果提示 kubectl not found 可能需要重启服务器

```

## 安装 minikube

- 2 个或更多 CPU
- 2GB 可用内存
- 20GB 可用磁盘空间
- 互联网连接
- 容器或虚拟机管理器
	- Linux: Docker、KVM、Podman
	- MacOS: Hyperkit
	- Windows: Hyper-V、Parallels、VirtualBox、Mware Fusion

1. 使用 [deb](https://minikube.sigs.k8s.io/docs/start/) 包安装
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

minikube start --image-mirror-country='cn' --force
```



