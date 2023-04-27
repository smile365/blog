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

## Java 项目开发环境

### JDK 安装
安装 jdk 8 [jdk](https://gitee.com/smile365/blog/blob/master/macos-jdk.md)
安装 jdk 11

 也可以使用[brew](https://zhuanlan.zhihu.com/p/611351908) 安装 jdk
```bash
brew install openjdk@17  
```

### 安装 jenv


### maven 安装
1. [install-maven](https://gitee.com/smile365/blog/blob/master/maven.md)
```bash
brew install maven
```
2. 配置国内镜像


### gradle 安装
1. install  gradle
```bash
brew install gradle
```

2. 配置 gradle 镜像源
编辑文件 `vi ~/.gradle/init.gradle` 内容如下：
```gradle
allprojects {
    repositories {
        def ALIYUN_REPOSITORY_URL = 'https://maven.aliyun.com/repository/public'
        all { ArtifactRepository repo ->
            if(repo instanceof MavenArtifactRepository){
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2')) {
                    project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_REPOSITORY_URL."
                    remove repo
                }
            }
        }
        maven { url ALIYUN_REPOSITORY_URL }
    }
}
```


3. 测试是否配置正确, `mkdir ~/tmp && vi ~/tmp/build.gradle ` 内容如下：
```
task showRepos {
    doLast {
        repositories.each {
            println "repository: ${it.name} ('${it.url}')"
        }
    }
}
```

执行命令 
```bash
gradle -q showRepos
# repository: maven ('https://maven.aliyun.com/repository/public')
```


### idea 安装


## Python 项目开发环境



## nodejs 项目开发环境

