---
title: docker-compose 使用教程
heading: 
date: 2022-04-13T09:46:03.580Z
categories: ["code"]
tags: 
description: Docker-Compose
---


## 前言
安装 [docker-compose](https://docs.docker.com/compose/install/) 有三种方式，分别是
- 安装 Docker Desktop
- 安装 docker-compose-plugin(前提是已经安装 docker )，此方式安装的命令为 docker compose
- 独立安装 Docker Compose。此方式安装的命令为 docker-compose 。




## 安装 docker-compose-plugin
1. 通过 pip 安装
```
pip install -U docker-compose
# 命令补缺
curl -L https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
# 卸载
# sudo pip uninstall docker-compose
docker-compose --version
```

2. 通过资源库安装，参考[install-using-the-repository](https://docs.docker.com/compose/install/linux/#install-using-the-repository)
```bash
# apt install -y docker-compose-plugin
# 安装 docker-ce 会自动安装  docker-compose-plugin
apt install -y docker-ce
docker compose version
```

## 配置镜像加速器

```bash
# 编辑配置文件
vim /etc/docker/daemon.json
```

内容：
```json
{
  "registry-mirrors": 
    [
        "https://docker.mirrors.sjtug.sjtu.edu.cn",
        "https://registry.docker-cn.com",
        "https://hccwwfjl.mirror.aliyuncs.com",
        "https://dmmxhzvq.mirror.aliyuncs.com",
        "https://nrbewqda.mirror.aliyuncs.com"
    ]
}
```

```bash
# 重启 docker
systemctl daemon-reload && systemctl restart docker
```

[其他镜像站](https://imnks.com/8302.html)
```bash
阿里云（杭州）   https://registry.cn-hangzhou.aliyuncs.com
阿里云（上海）   https://registry.cn-shanghai.aliyuncs.com
阿里云（青岛）   https://registry.cn-qingdao.aliyuncs.com
阿里云（北京）   https://registry.cn-beijing.aliyuncs.com
阿里云（张家口）   https://registry.cn-zhangjiakou.aliyuncs.com
阿里云（呼和浩特）   https://registry.cn-huhehaote.aliyuncs.com
阿里云（乌兰察布）   https://registry.cn-wulanchabu.aliyuncs.com
阿里云（深圳）   https://registry.cn-shenzhen.aliyuncs.com
阿里云（河源）   https://registry.cn-heyuan.aliyuncs.com
阿里云（广州）   https://registry.cn-guangzhou.aliyuncs.com
阿里云（成都）   https://registry.cn-chengdu.aliyuncs.com
腾讯云   https://mirror.ccs.tencentyun.com
微软云   https://dockerhub.azk8s.com
网易   https://hub-mirror.c.163.com
上海交通大学   https://mirror.sjtu.edu.cn/docs/docker-registry
❤❤❤南京大学   https://docker.nju.edu.cn
道客 DaoCloud   https://f1361db2.m.daocloud.io
阿里云（香港）   https://registry.cn-hongkong.aliyuncs.com
阿里云（日本-东京）   https://registry.ap-northeast-1.aliyuncs.com
阿里云（新加坡）   https://registry.ap-southeast-1.aliyuncs.com
阿里云（澳大利亚-悉尼）   https://registry.ap-southeast-2.aliyuncs.com
阿里云（马来西亚-吉隆坡）   https://registry.ap-southeast-3.aliyuncs.com
阿里云（印度尼西亚-雅加达）   https://registry.ap-southeast-5.aliyuncs.com
阿里云（印度-孟买）   https://registry.ap-south-1.aliyuncs.com
阿里云（德国-法兰克福）   https://registry.eu-central-1.aliyuncs.com
阿里云（英国-伦敦）   https://registry.eu-west-1.aliyuncs.com
阿里云（美国西部-硅谷）   https://registry.us-west-1.aliyuncs.com
阿里云（美国东部-弗吉尼亚）   https://registry.us-east-1.aliyuncs.com
阿里云（阿联酋-迪拜）   https://registry.me-east-1.aliyuncs.com
谷歌云   https://gcr.io
官方   https://registry.hub.docker.com
```


## 项目的 dockerfile 文件


编写一份 [Dockerfile](https://yeasy.gitbook.io/docker_practice/image/build) 文件
```
# 临时镜像
FROM python:3.7-slim as builder
WORKDIR /app
COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple 
# 最终镜像
FROM python:3.7-slim 
WORKDIR /app
COPY --from=builder /app/wheels /wheels
RUN pip install --no-cache /wheels/* -i https://pypi.douban.com/simple
COPY . .
CMD ["python", "task.py"]
```

构件镜像
```bash
docker build -t sxytask:v1 .
docker images
docker history sxytask:v1
# 删除镜像
# docker image rm xxx
# docker rmi -f sxytask:v1
# 删除容器
# docker rm $(docker ps -a -q)
```

镜像比较大的话，可通过适当的策略[精简 docker 镜像](https://shenxianpeng.github.io/2022/01/docker-best-practice/)大小

启动容器 [docker run](https://yeasy.gitbook.io/docker_practice/container/run)
```bash
docker run -d -v /home/sxy/daily_task/stock/dbs:/app/stock/dbs sxytask:v1
```

## 编写 docker-compose.yaml 文件

[yam文件](https://yeasy.gitbook.io/docker_practice/compose/compose_file)格式如下：

```yaml
version: '3'
services: 
  app:
    build: .

  redis:
    image: "redis:alpine"
    restart: always
    environment:
      requirepass: '${REDIS_PASSWORD}'
    ports:
      - "6379:6379"
    volumes:
      - /data/redis/data:/data
      - /data/redis/conf/redis.conf:/etc/redis/redis.conf


  postgres:
    image: "postgres"
    restart: always
    environment:
      POSTGRES_PASSWORD: '${POSTGRES_PASSWORD}'
    ports:
      - "5432:5432"
    volumes:
      - /data/postgres:/var/lib/postgresql/data
```

通过 [up 命令](https://yeasy.gitbook.io/docker_practice/compose/commands#up) 启动
```bash
docker-compose up
# or docker-compose up -d
```

## 问题解决

### 无法解析域名

问题：Could not resolve host: mirror.ccs.tencentyun.com

需要配置[域名解析](https://sxy91.com/posts/centos-dns/)。
```
echo "nameserver 114.114.114.114" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```

### 无法安装 numpy

Alpine 是的 C 库为 MUSL libc 与 标准的 Glibc 库差异较大。大多数偏低层的库如 pands、opencv、numpy 都不兼容，需要安装专门为 Alpine 编译的版本，还有部分软件的开发者不提供 Alpine 版本。 

### cv2 安装失败问题

cv2 有 [4 个版本](https://pypi.org/project/opencv-python/)
本项目需要在容器内需要安装 opencv-contrib-python-headless 的版本

```bash
pip install opencv-contrib-python-headless -i https://pypi.tuna.tsinghua.edu.cn/simple 
```

否则会遇到如下错误：
- ModuleNotFoundError: No module named 'cv2'
- opencv ImportError: libGL.so.1: cannot open shared object file: No such file or directory






参考文档
- [docker-compose、docker swarm和k8s的区别](https://www.jianshu.com/p/2a9ae69c337d)
- [Docker、Docker-Compose、k8s的演变](https://juejin.cn/post/6844904046025768974)
- [docker-compose安装与卸载](https://yeasy.gitbook.io/docker_practice/compose/install)
- [githubusercontent 404](https://github.com/hawtim/hawtim.github.io/issues/10)
- 腾讯云 [私有镜像服务](https://console.cloud.tencent.com/tke2/registry/user/self?rid=4)
- [docker-hub 加速器](https://yeasy.gitbook.io/docker_practice/install/mirror)
- [docker中依赖numpy 导致 docker build 崩溃](https://stackoverflow.com/questions/63163058/collecting-numpy-causes-docker-build-to-crash)
- [减少镜像体积最佳实战](https://shenxianpeng.github.io/2022/01/docker-best-practice/)
- [精简 docker 镜像](https://zhuanlan.zhihu.com/p/341011419)