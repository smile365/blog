---
title:  配置 gitlab-ci.yml 实现提交代码，自动部署到容器
heading: 
date: 2021-03-24T08:08:59.340Z
categories: ["code"]
tags: 
description: gitlab-ci.yml,gitlab-ci-config
---

### 一、后端项目打包和发布

项目下新建一个 `.gitlab-ci.yml` 文件，内容如下：

```
stages:
  - build

build:
  image: docker:19.03.8
  stage: build
  only:
    - develop
  script:
    - docker login --username=yourname -p yourpass registry.cn-beijing.aliyuncs.com
    - docker build -t youraliyun.com:${CI_COMMIT_SHORT_SHA} .
    - docker push youraliyun.com:${CI_COMMIT_SHORT_SHA}
    - docker tag youraliyun.com:${CI_COMMIT_SHORT_SHA} youraliyun.com:latest
    - docker push youraliyun.com:latest
```

若你的 gitlab 仓库开启了 ci/cd 那么，push 代码的时候会自动构建并把镜像推送到自己的创建的容器仓库里。


### 前端项目打包和发布

```bash

FROM node:14.15-alpine as BUILD_IMAGE
WORKDIR /app
COPY . .
RUN yarn install --registry https://registry.npm.taobao.org/

RUN yarn build

FROM nginx:alpine
COPY --from=BUILD_IMAGE /app/build /usr/share/nginx/html # 具体看配置的构建好的静态文件目录
# 本项目 build 之后的静态文件放在了 build 目录。
```

可能出现的问题：刷新后页面出现 404 
原因：react 为单页应用，刷新后路由不再由 react（前端表现为 js 处理）
，直接由浏览器去请求响应的静态资源，找不到此资源，因此保存。

解决方法：

新建一个 `default.conf` 文件，增加一行配置`try_files $uri $uri/ /index.html;`，内容如下：
```nginx
server {
    listen       80;
    location / {
        root   /usr/share/nginx/html;
        try_files $uri $uri/ /index.html;
    }
}
```



参考文档 
- [Docker — 从入门到实践](https://yeasy.gitbook.io/docker_practice/repository/registry)
- [使用Docker对ReactJS，NodeJS，NGINX进行Docker化](https://dev.to/subhransu/nevertheless-subhransu-maharana-coded-5eam)
- [docker-run-static-website](https://tecadmin.net/tutorial/docker-run-static-website)
- [React部署于Nginx环境中刷新后404解决方案](https://www.ghosind.com/2020/08/14/react-404-after-reload)