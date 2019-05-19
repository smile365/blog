---
title:  centos 安装docker
date: 2018-08-02T07:54:20.501Z
tags: ["docker"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

Docker 最低支持 CentOS 7。

```shell
#step 1: 安装必要的一些系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# Step 3: 更新并安装 Docker-CE
sudo yum makecache fast
sudo yum -y install docker-ce
# Step 4: 开启Docker服务
sudo service docker start
docker version
开机启动
systemctl enable docker
```

如何使用Docker加速器


您可以通过修改daemon配置文件/etc/docker/daemon.json来使用加速器：
```shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://reg-mirror.qiniu.com"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
检查加速器是否生效

Linux系统下配置完加速器需要检查是否生效，在命令行执行 ps -ef | grep dockerd，如果从结果中看到了
配置的 --registry-mirror 参数说明配置成功。

测试  
```shell
docker pull centos
docker run -it centos /bin/bash
```

参考  
- [docker镜像](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/)
- [安装Docker CE](https://yeasy.gitbooks.io/docker_practice/content/install/centos.html)
- [docker logs](https://www.jianshu.com/p/1eb1d1d3f25e)
- [docker-hub镜像加速器](https://yeasy.gitbooks.io/docker_practice/install/mirror.html)