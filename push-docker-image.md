


# 阿里云容器镜像服务使用教程

## 环境准备
- docker 

## 创建仓库

1. 打开[阿里云镜像服务网站](https://cr.console.aliyun.com/repository/cn-hangzhou/sxycn/jdk/details)

2. 创建仓库
本次为 jdk-agent

3. 登录阿里云Docker Registry
```bash
docker login --username=yourname registry.cn-hangzhou.aliyuncs.com
#用于登录的用户名为阿里云账号全名，密码为开通服务时设置的密码。
```


4. 构建镜像
先编辑 Dockerfile
```
FROM  openjdk:11
RUN wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
```

构建
```
docker build -t jdk11-agent:1.0 .
docker images
# REPOSITORY    TAG       IMAGE ID       CREATED              SIZE
# jdk11-agent   1.0       c771ac51922a   About a minute ago   672MB
```



5. 将镜像推送到Registry
```
$ docker login --username=yourname registry.cn-hangzhou.aliyuncs.com
$ docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/sxycn/jdk-agent:[镜像版本号]
$ docker push registry.cn-hangzhou.aliyuncs.com/sxycn/jdk-agent:[镜像版本号]
# 请根据实际镜像信息替换示例中的[ImageId]和[镜像版本号]参数。
```


6. 从Registry中拉取镜像
```
$ docker pull registry.cn-hangzhou.aliyuncs.com/sxycn/jdk-agent:[镜像版本号]
```



7. 推送已有镜像
使用"docker tag"命令重命名镜像，并将它通过专有网络地址推送至Registry。
```
$ docker images
REPOSITORY                                                         TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
registry.aliyuncs.com/acs/agent                                    0.7-dfb6816         37bb9c63c8b2        7 days ago          37.89 MB
$ docker tag 37bb9c63c8b2 registry-vpc.cn-hangzhou.aliyuncs.com/acs/agent:0.7-dfb6816
使用 "docker push" 命令将该镜像推送至远程。

$ docker push registry-vpc.cn-hangzhou.aliyuncs.com/acs/agent:0.7-dfb6816
```

8. 使用内网镜像仓库地址
从ECS推送镜像时，可以选择使用镜像仓库内网地址。推送速度将得到提升并且将不会损耗您的公网流量。
如果您使用的机器位于VPC网络，请使用 registry-vpc.cn-hangzhou.aliyuncs.com 作为Registry的域名登录。

