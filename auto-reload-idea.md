---
title: auto-reload-idea
heading:  idea 2022.3.2 mac 版本热部署配置
date: 2023-02-16T05:33:39.140Z
categories: ["other"]
tags: 
description:  how-to-make-auto-reload-with-spring-boot-on-idea-intellij
---


## 添加依赖
```xml
<!--热部署依赖，生产环境、应用被打成jar包后，自动失效-->
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-devtools</artifactId>
	<optional>true</optional>
</dependency>
```

## 打开 settings
快捷键：Command + ，
![enter description here](https://cdn.sxy21.cn/static/imgs/1676525901618.png)

![enter description here](https://cdn.sxy21.cn/static/imgs/1676526063793.png)



![enter description here](https://cdn.sxy21.cn/static/imgs/1676526118622.png)


