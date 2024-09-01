---
title: "macOS 安装 maven"
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
# bash 环境 vi ~/.bash_profile
# zsh 环境 vi ~/.zshrc
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
source ~/.zshrc

mvn -version

# 开始安装 maven
brew install maven

# 查看生效的配置
# mvn help:effective-settings

# 查看 mvn 信息和 Java 信息
#  mvn -X
```



## 配置 maven 镜像站

1. settings.xml 文件位置
- 全局配置： ${maven.home}/conf/settings.xml
- 用户配置： ${user.home}/.m2/settings.xml
- 项目配置： pom.xml

配置优先级从高到低：pom.xml > user settings > global settings

2. 配置 [阿里云的 maven](https://developer.aliyun.com/mvn/guide?spm=a2c6h.13651104.mirror-free-trial.5.43586e1aa9QhtF) 镜像
在  `~/.m2/settings.xml` 中增加以下 xml 代码：
```xml
<settings>
  <mirrors>
    <mirror>
      <id>aliyun</id>
      <name>aliyun Maven</name>
      <url>https://maven.aliyun.com/repository/public/</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
</settings>
```
 **注意：** 
- mirrorOf： 不能填写“*” ，否则会遇到依赖找不到的情况，因为 aliyun 不是最全的。填写 central 当 aliyun 没有的时候会从中央仓库下载。

3. 检测是否配置成功
```bash
mvn help:effective-settings
# 看到输出含有“阿里云公共仓库” 即可
```


## idea 不显示 maven 
在 idea 最右侧会有 maven 窗口，如果不显示可通过如下方式解决：
  - 法一：view --> tool windows --> maven projects
  - 法二：Settings
	  - Windows : File --> Settings
	  - MacOS:  IntelliJ IDEA --> Preferences 
		  -  plugins --> 在搜索框中输入 maven，勾选那两个插件 --> OK -->  根据提示重启 idea
- 法三：右键 pom.xml  --->  add as maven

![enter description here](https://cdn.sxy21.cn/static/imgs/1671767581208.png)

## 参考文档
- [maven](https://maven.apache.org/install.html)
- [settings.html](https://maven.apache.org/settings.html)
- [阿里云 Maven 镜像仓库](https://developer.aliyun.com/mirror/maven)
- [How to Install Maven on Mac OS](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)
- [JAVA_HOME](https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/)
- [settings.xml 位置](https://cloud.tencent.com/developer/article/1522574)
- [spring-boot](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started)