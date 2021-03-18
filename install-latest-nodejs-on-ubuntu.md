---
title: Ubuntu下快速安装nodejs 
heading: Ubuntu秒级别安装和升级到nodejs最新版
date: 2021-03-18T14:38:35.115Z
categories: ["code"]
tags: 
description: 升级 nodejs 到最新版，install-latest-nodejs-on-ubuntu
---

Ubuntu 18.04.4 LTS 默认安装的 nodejs 的版本是 v12.21.0 ，此版本比较老，不支持某些特殊的语法，比如 `data?.value` ，以下是快速安装最新版的方法。

安装 nodejs、npm、n
```bash
apt install nodejs npm
node -v
# v12.21.0
npm -v 
# 6.14.8

# 安装 n 模块
sudo npm install -g n
# 使用 n 安装 node
sudo n latest
```

若使用 npm 安装软件特别慢，可修改 npm 的镜像地址
```bash
# 查看镜像源
npm config get registry
# 修改镜像源
npm config set registry https://registry.npm.taobao.org/
```

若使用 n 模块安装 node 特别慢，可配置 n 模块的镜像地址

```bash
export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
n latest
node -v
```

此时可发现安装过程中提示的地址已经改成镜像地址，基本在几秒内即可安装完成。

参考文档：  
- [NPM 国内加速，修改镜像源](https://learnku.com/articles/15975/npm-accelerate-and-modify-mirror-source-in-china)
- [Ubuntu 18.04 Node.js 安装并使用阿里云镜像加速](https://blog.csdn.net/VHs1996/article/details/105316925)
