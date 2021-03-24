---
title:  gitlab-ci-config
heading: 配置 gitlab-ci.yml 实现提交代码，自动部署到容器
date: 2021-03-24T08:08:59.340Z
categories: ["code"]
tags: 
description: gitlab-ci.yml
---


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


参考文档 
- [Docker — 从入门到实践](https://yeasy.gitbook.io/docker_practice/repository/registry)