---
title:  vanus
heading: vanus 使用调研
date: 2022-10-26T08:00:55.738Z
categories: ["code"]
tags: 
description: 
---

## 前言

## 环境准备
操作系统：centos 8 （使用 pve 的模板安装）

1. 可替换为[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)
```bash
cp -r /etc/yum.repos.d/ /etc/yum.repos.bak

# 对于 CentOS 8
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
# 更新
sudo yum makecache
```

2. 针对 [appstream 错误 ](https://cloud.tencent.com/developer/article/1988392)
因为 centos 把库迁移了
```bash
dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos

dnf distro-sync
```

也可以[参考教程]( https://blog.csdn.net/jiangxo/article/details/123246144)，替换 repo 的相关路劲：
```
/$contentdir/$releasever/AppStream/$basearch/os/
/centos/8-stream/AppStream/x86_64/os/
```


## 安装 docker
1. 安装 docker
```bash
yum install -y yum-utils
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce

# 测试
docker -v
# Docker version 20.10.21, build baeda1f
service docker start
```
2. 配置 dockerhub [加速器](https://developer.aliyun.com/article/29941)
```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://yourxxx.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
# 执行 docker info，看到Registry Mirrors:信息则表示生效
docker info
```



## 安装 kubectl

参考官网 [kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) 

```bash
# 下载
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# 安装
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# 验证
kubectl version --client --output=yaml
# kustomizeVersion: v4.5.7
```

## 安装 minikube

参考官网 [minikube](https://minikube.sigs.k8s.io/docs/start/)，并使用[中国镜像](https://developer.aliyun.com/article/221687)启动
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
# 测试
minikube version
# minikube version: v1.27.1
# 启动
minikube start --image-mirror-country='cn' --force
# 或者 minikube start --driver=docker --container-runtime=containerd --image-mirror-country=cn --force
# 如果以前启动过，请删掉 minikube 的 配置文件重新启动，否则无法使用镜像仓库
# minikube logs |grep config.json
```


## 安装 vanus

```
curl -O https://download.linkall.com/all-in-one/v0.3.0.yml
kubectl apply -f v0.3.0.yml
```


参考文档: 
- [vanus](https://docs.linkall.com/introduction/what-is-vanus)