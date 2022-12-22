---
title:  maven
heading:  
date: 2022-12-22T02:46:22.351Z
tags: 
categories: ["code"]
Description:  
---


## macOS 安装 maven

```bash
# 检测是否安装
java -version  # 需要 Java 依赖

# vi ~/.bash_profile
export JAVA_HOME=$(/usr/libexec/java_home)

mvn -version

brew install maven
```



## 参考文档
- [maven](https://maven.apache.org/install.html)
- [settings.html](https://maven.apache.org/settings.html)
- [阿里云 Maven 镜像仓库](https://developer.aliyun.com/mirror/maven)
- [How to Install Maven on Mac OS](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)
- [JAVA_HOME](https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/)