---
title:  maven
heading:  
date: 2022-12-22T02:46:22.351Z
tags: 
categories: ["code"]
Description:  
---


## macOS 安装 maven
idea 自带 maven 但是不方便配置镜像站，建议重新安装。
```bash
# 检测是否安装
java -version  # 需要 Java 依赖

# 查看 jdk 的版本和路径
/usr/libexec/java_home -v

# export JAVA_HOME=$(/usr/libexec/java_home) # 只安装了一个 jdk 可以如此
# # vi ~/.bash_profile
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
mvn -version

brew install maven

# 查看生效的配置
# mvn help:effective-settings

# 查看 mvn 信息和 Java 信息
#  mvn -X
```

## 配置 maven 镜像站

settings.xml 文件位置
- 全局配置： ${maven.home}/conf/settings.xml
- 用户配置： ${user.home}/.m2/settings.xml
- 项目配置： pom.xml

配置优先级从高到低：pom.xml > user settings > global settings

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


![enter description here](https://cdn.sxy21.cn/static/imgs/1671767581208.png)
## idea 不显示 maven 
在 idea 最右侧会有 maven 窗口，如果不显示可通过如下方式解决：
  - 法一：view --> tool windows --> maven projects
  - 法二：Settings
	  - Windows : File --> Settings
	  - MacOS:  IntelliJ IDEA --> Preferences 
		  -  plugins --> 在搜索框中输入 maven，勾选那两个插件 --> OK -->  根据提示重启 idea
- 法三：右键 pom.xml  --->  add as maven


## 参考文档
- [maven](https://maven.apache.org/install.html)
- [settings.html](https://maven.apache.org/settings.html)
- [阿里云 Maven 镜像仓库](https://developer.aliyun.com/mirror/maven)
- [How to Install Maven on Mac OS](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)
- [JAVA_HOME](https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/)
- [settings.xml 位置](https://cloud.tencent.com/developer/article/1522574)
- [spring-boot](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started)