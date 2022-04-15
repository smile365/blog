---
title: docker-compose 
heading: 
date: 2022-04-13T09:46:03.580Z
categories: ["code"]
tags: 
description: Docker-Compose
---

## 安装 Docker-Compose
通过 pip 安装
```
pip install -U docker-compose
# 命令补缺
curl -L https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
# 卸载
# sudo pip uninstall docker-compose
docker-compose --version
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