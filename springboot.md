---
title:  spring boot从入门到放弃
heading: 
date: 2020-04-07T02:45:56.177Z
categories: ["life"]
draft: true
tags: 
description: 
---

1. web服务器/[Servlet容器](https://blog.csdn.net/snarlfuture/article/details/18473761)/[Servlet](https://gg0.chn.moe/extdomains/zh.wikipedia.org/zh-hans/Java_Servlet)

controller

支持Servlet的[web服务器](http://blog.didispace.com/books/spring-boot-reference/II.%20Getting%20started/9.1.%20Servlet%20containers.html)


2. 环境
    - java 8
    - maven,[pom.xml](https://maven.apache.org/pom.html#What_is_the_POM)
    - idea

[检测]([](http://blog.didispace.com/books/spring-boot-reference/II.%20Getting%20started/11.%20Developing%20your%20first%20Spring%20Boot%20application.html))


maven + spring boot 的优势。 2/3个依赖搞定所有依赖，告别大版本，告别导入n多包。

[spring-boot-starter](http://blog.didispace.com/books/spring-boot-reference/II.%20Getting%20started/11.2.%20Adding%20classpath%20dependencies.html)



3. controller注解,[hello word](http://blog.didispace.com/books/spring-boot-reference/II.%20Getting%20started/10.2.6.%20Quick%20start%20Spring%20CLI%20example.html)

4. 测试
    本地测试
    远端测试

6. [发布与打包](http://blog.didispace.com/books/spring-boot-reference/II.%20Getting%20started/11.5.%20Creating%20an%20executable%20jar.html)

jar包/war包 启动方式

依赖注入，控制反转，与注解

[EnableAutoConfiguration](http://blog.didispace.com/books/spring-boot-reference/III.%20Using%20Spring%20Boot/14.2.%20Locating%20the%20main%20application%20class.html)


[自动配置](http://blog.didispace.com/books/spring-boot-reference/III.%20Using%20Spring%20Boot/16.%20Auto-configuration.html)

[Spring IoC容器](https://www.baeldung.com/spring-bean)

spring beans 


请求 
    - 参数
    - 参数验证
    

相应
    - string
    - xml
    - json
    
99%的人接触到的项目都是对数据的增删改查。

sping data jpa

mybatis

redis

登录验证


使用[YAML](http://blog.didispace.com/books/spring-boot-reference/IV.%20Spring%20Boot%20features/24.6.1.%20Loading%20YAML.html)格式的配置文件，[YAML缺点](http://blog.didispace.com/books/spring-boot-reference/IV.%20Spring%20Boot%20features/24.6.4.%20YAML%20shortcomings.html)

value注解，应用内参数配置

跨域资源共享（CORS）

