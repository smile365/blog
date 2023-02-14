---
title:  centos安装docker
date: 2018-08-02T07:54:20.501Z
tags: ["docker"]
categories: ["code"]
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
    "https://registry.docker-cn.com",
    "https://dockerhub.azk8s.cn"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
执行`docker info`，看到Registry Mirrors:信息则表示生效


> 注：若购买的是云服务器，用云服务器厂商提供的加速器会更快。[腾讯云](https://cloud.tencent.com/document/product/1207/45596?from=information.detail.%E8%85%BE%E8%AE%AF%E4%BA%91%E5%8A%A0%E9%80%9Fdocker)的 docker 加速器为：`https://mirror.ccs.tencentyun.com`，[阿里云](https://help.aliyun.com/document_detail/60750.html)的 docker 加速器需要登录容器镜像服务控制台后，在左侧导航栏选择镜像工具 > 镜像加速器，可以找到单独独立分配的加速器地址。


测试使用 
```shell
#后台运行alpine
docker run -d -ti --name a alpine
#进入容器
docker exec -it a /bin/sh
#删除所有CONTAINER
docker rm $(docker ps -a -q)
```

启动docker报错
```log
start request repeated too quickly 
Failed to start Docker Application Container Engine
docker.service failed 
```
一般是配置文件错误，请查看`/etc/docker/daemon.json`文件中的json格式是否正确。


## 常用命令和参数
**run 命令常用参数**
- -p:主机端口:容器端口
- -d:后台运行
- --name:取一个别名
- -v:主机目录:容器目录

**ps 命令参数**
- 


## 参考文档  
- [docker镜像](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/)
- [安装Docker CE](https://yeasy.gitbooks.io/docker_practice/content/install/centos.html)
- [docker logs](https://www.jianshu.com/p/1eb1d1d3f25e)
- [docker-hub镜像加速器](https://yeasy.gitbooks.io/docker_practice/install/mirror.html)
- [docker-run](http://www.runoob.com/docker/docker-run-command.html)
- [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/)
- [config.json](https://www.cnblogs.com/ningskyer/articles/8330143.html)
- [腾讯云私有镜像服务](https://cloud.tencent.com/document/product/1141/50332)
- [腾讯云加速docker](https://cloud.tencent.com/document/product/1207/45596?from=information.detail.%E8%85%BE%E8%AE%AF%E4%BA%91%E5%8A%A0%E9%80%9Fdocker)
- [删除Docker中所有已停止的容器](https://www.cnblogs.com/jiu0821/p/10397822.html)
- [启动已停止的容器](https://www.jianshu.com/p/bbf6343a81cb)