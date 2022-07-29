---
title:  kubesphere 安装和使用教程
heading:
date: 2022-07-27T14:24:22.704Z
categories: ["code"]
tags: 
description: 
---

## 安装说明
 使用 [kubeke](https://github.com/kubesphere/kubekey/releases) 在 centos 7 上安装 [kubesphere](https://github.com/kubesphere/kubesphere/)，安装过程可以参考 [quick-start](https://kubesphere.io/zh/docs/v3.3/quick-start/all-in-one-on-linux/) 
 
 
 k8s 的最新进为 [Kubernetes v1.24.3](https://github.com/kubernetes/kubernetes)
 
 ```
yum install -y socat conntrack ebtables ipset
curl -sfL https://get-kk.kubesphere.io | VERSION=v2.2.2 sh -

./kk create cluster --with-kubernetes v1.22.10 --with-kubesphere v3.3.0 --container-manager containerd
# 输入 yes 即可
 ```





## 错误处理

需要安装依赖
```bash
| sudo | curl | openssl | ebtables | socat | ipset | ipvsadm | conntrack | chrony | docker | containerd | nfs client | ceph client | glusterfs client
This is a simple check of your environment.
Before installation, ensure that your machines meet all requirements specified at
https://github.com/kubesphere/kubekey#requirements-and-recommendations

```

需要指定容器运行时
```bash
[Notice]
Incorrect runtime. Please specify a container runtime other than Docker to install Kubernetes v1.24 or later.
You can set "spec.kubernetes.containerManager" in the configuration file to "containerd" or add "--container-manager containerd" to the "./kk create cluster" command.
For more information, see:
https://github.com/kubesphere/kubekey/blob/master/docs/commands/kk-create-cluster.md
https://kubernetes.io/docs/setup/production-environment/container-runtimes/#container-runtimes
https://kubernetes.io/blog/2022/02/17/dockershim-faq/
```


参考  [kubesphere-issues-3313](https://github.com/kubesphere/kubesphere/issues/3313)删除机器中的 kubekey 文件夹。
```bash
v1.24.3/bin/linux/amd64/kubeadm error: No SHA256 found for kubeadm. v1.24.3 is not supported

#发现并不顶用，还是安装官方文档安装推荐的 kubernetes 的版本 v1.22.10 

```


 
 
 