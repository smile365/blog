---
title:  centos 安装docker
date: 2018-08-02T07:54:20.501Z
tags: ["docker"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

**Docker最低支持 CentOS 7**

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

**配置数据路径和Docker加速器**  
data-root默认为/var/lib/docker，一般分配较小，可改到其他路径。修改daemon配置文件/etc/docker/daemon.json：
```shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "data-root": "/home/softdata/docker",
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://reg-mirror.qiniu.com"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
执行`docker info`，看到Registry Mirrors:信息则表示生效

测试使用 
```shell
#后台运行alpine
docker run -d -ti --name a alpine
#进入容器
docker exec -it a /bin/sh
#删除所有CONTAINER
docker rm $(docker ps -a -q)
```



参考  
- [docker镜像](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/)
- [安装Docker CE](https://yeasy.gitbooks.io/docker_practice/content/install/centos.html)
- [docker logs](https://www.jianshu.com/p/1eb1d1d3f25e)
- [docker-hub镜像加速器](https://yeasy.gitbooks.io/docker_practice/install/mirror.html)
- [docker-run](http://www.runoob.com/docker/docker-run-command.html)
- [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/)
- [config.json](https://www.cnblogs.com/ningskyer/articles/8330143.html)