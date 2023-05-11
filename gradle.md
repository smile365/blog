---
title: gradle 安装
date: 20123-05-11
categories: ["code"]
description:
---



在 Debian 系统中，可以通过安装 Gradle 的二进制包来安装 Gradle。以下是安装步骤：

1. 安装 JDK

   在安装 Gradle 之前，需要先安装 JDK。可以使用以下命令安装 OpenJDK：

   ```
    apt update
    apt install -y default-jdk
    java -version
   ```

2. 下载 Gradle

   在 Gradle 官网（https://gradle.org/install/）下载最新的 Gradle 二进制包。可以使用以下命令下载 Gradle 8.1.1 版本：

   ```
   wget https://downloads.gradle.org/distributions/gradle-8.1.1-bin.zip -P /tmp
   
   ```

3. 解压并安装 Gradle

   解压下载的 Gradle 二进制包，并将其移动到 `/opt/gradle` 目录下：

   ```
   unzip -d /opt/gradle /tmp/gradle-*.zip
   ```

4. 配置环境变量

   将 Gradle 的 bin 目录添加到系统的 PATH 环境变量中，使得可以在任意目录下使用 Gradle 命令：

   ```
   nano /etc/profile.d/gradle.sh
   ```

   在打开的文件中，添加以下内容：

   ```
   export PATH=/opt/gradle/gradle-8.1.1/bin:$PATH
   ```

   保存并退出文件编辑器。

5. 使环境变量生效

   执行以下命令使新添加的环境变量生效：

   ```
   source /etc/profile.d/gradle.sh
   ```

6. 验证安装

   执行以下命令，查看 Gradle 是否安装成功：

   ```
   gradle -v
   ```

   如果输出 Gradle 的版本信息，则说明安装成功。

以上就是在 Debian 系统中安装 Gradle 的步骤。


可以使用 [sdkman](sdkman) 安装 gradle
```bash
curl -s "https://get.sdkman.io" | bash
```

