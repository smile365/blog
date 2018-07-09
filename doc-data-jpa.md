---
title:  项目说明
date: 2018-07-09T06:46:05.091Z
tags: ["交接文档"]
series: ["blog"]
categories: ["code"]
draft: true
description:
cover: 
---

java项目结构说明（以cms为例）

![cms.war](https://i.loli.net/2018/07/09/5b4304ec2b069.jpg)

api:用到的外部接口
base：基础框架
controller：控制层(api入口)
mapper:mybatis mapper
model:未对数据库映射的实体类
redis：redis数据库操作
repository：数据库crud的接口定义
service：服务层
task：定时任务
vo:特定返回值包装类
XxxConfig：spring boot配置类
resources：配置项资源
targ：构建后生成的包和文件
test：单元测试


资源文件说明
application.properties：总配置
application-dev.properties：开发环境的配置(本地)
application-prod.properties：发布环境的配置(正式)
application-test.properties：测试环境的配置(测试)

在总配置中通过spring.profiles.active=prod|test|dev指定启用的配置

特殊说明：
框架基于jpa对数据层做了封装，在repository层只需要定义接口，无需实现即可对数据增删改查，包括分页及排序。

![interface](https://i.loli.net/2018/07/09/5b43098af0dcf.jpg)

![use](https://i.loli.net/2018/07/09/5b43095e37c01.jpg)

具体使用方式可参考[spring-data-jpa](http://projects.spring.io/spring-data-jpa/#quick-start)，或者查看Repository

