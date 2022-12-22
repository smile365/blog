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

## 配置 maven 镜像站
在  `~/.m2/setting.xml` 中的 mirrors 节点增加 mirror：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <mirrors > 
            <mirror>
                <id>aliyunmaven</id>
                <mirrorOf>*</mirrorOf>
                <name>阿里云公共仓库</name>
                <url>https://maven.aliyun.com/repository/public</url>
            </mirror>
      </mirrors>
</settings>
```

## 参考文档
- [maven](https://maven.apache.org/install.html)
- [settings.html](https://maven.apache.org/settings.html)
- [阿里云 Maven 镜像仓库](https://developer.aliyun.com/mirror/maven)
- [How to Install Maven on Mac OS](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)
- [JAVA_HOME](https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/)