---
title:  nodejs
heading: 
date: 2023-08-23T18:16:05.490Z
categories: ["code"]
tags: 
description: 
---

## 系统环境

- MacBook Air：2022 m2, 24G
- MacOS：13.4 


## 使用 NVM 安装 nodejs
nodejs 一般每年会升级两个大版本，偶数版是生产可用的版本（LTS），具体版本生命周期可查看 [nodejs-release](https://github.com/nodejs/release#release-schedule)。

NVM 是一种用于管理设备上的 Node 版本的工具，可实现不同项目使用不同版本的 Node.js。

```bash
nvm install --lts  # 最新长期支持版（当前为 18）
nvm install 20 # 特定版本
# 安装完成后自带 npm 命令
```

## 安装 yarn

```bash
node -v
npm -v
npm install -g npm@latest

npm install --global yarn
yarn -v
```








