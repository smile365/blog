---
title:  vanus
heading: vanus 使用调研
date: 2022-10-26T08:00:55.738Z
categories: ["code"]
tags: 
description: 
---

## 前言

## 环境说明
操作系统：centos 8 stream




## 安装 docker

1. 可替换为[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)
```bash
cp -r /etc/yum.repos.d/ /etc/yum.repos.bak

# 对于 CentOS 8
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
```

2. 安装
```bash
yum install -y yum-utils
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce

# 测试
docker -version
# Docker version 20.10.21, build baeda1f
```


## 安装 minikube

参考官网 [minikube](https://minikube.sigs.k8s.io/docs/start/)
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
# 测试
minikube version
# minikube version: v1.27.1
```



## 安装 kubectl

参考官网 [kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) 

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl version --client --output=yaml
# kustomizeVersion: v4.5.7
```


## 安装

```
curl -O https://download.linkall.com/all-in-one/v0.3.0.yml
kubectl apply -f v0.3.0.yml
```


参考文档: 
- [](https://docs.linkall.com/introduction/what-is-vanus)