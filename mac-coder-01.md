---
title:  mac-cocder-01
heading:  
date: 2023-02-02T12:50:14.806Z
tags: 
categories: ["other"]
Description:  
---

程序员使用 mac

## 目标
1. 安装常用软件
    - edge 浏览器
    - 双拼输入法（微信键盘/百度输入法/搜狗输入法）
    - 微信
    - 飞书
2. 解决防火墙上网
    - xxx
3. 安装常用开发工具
    - brew（[国内源](https://zhuanlan.zhihu.com/p/111014448)）
    - git
    - sublime text
    - vscode
    - idea



## 安装 brew

```bash
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
brew -v
# 新版需要配置安全目录
git config --global --add safe.directory /opt/homebrew/Library/Taps/homebrew/homebrew-core
git config --global --add safe.directory /opt/homebrew/Library/Taps/homebrew/homebrew-cask
brew -v
```

## 安装 git
```bash
git -v
```
在 mac 终端命令执行 `git -version`, 没安装一般会自动安装，也可以从 [git-scm](https://git-scm.com/download/mac) 手动下载安装包安装


配置 github 的 keys
```bash
ssh-keygen -t rsa
```