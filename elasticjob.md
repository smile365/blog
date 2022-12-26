---
title:  elasticjob 教程
heading:  
date: 2022-12-26T13:12:17.023Z
tags: 
categories: ["code"]
Description:  
---
[ElasticJob](https://shardingsphere.apache.org/elasticjob/current/cn/overview/#%E7%8E%AF%E5%A2%83%E8%A6%81%E6%B1%82)环境要求
- Java 8+
- Maven 3.5.0+
- ZooKeeper 3.6.0+


## ElasticJob-Lite

1. 提前安装好 ZooKeeper

2. 新建一个 spring boot 项目，版本选择 2.7.7

3. 引入 [elasticjob-lite-spring-boot-starter](https://mvnrepository.com/artifact/org.apache.shardingsphere.elasticjob/elasticjob-lite-spring-boot-starter)依赖
```xhtml
<dependency>
            <groupId>org.apache.shardingsphere.elasticjob</groupId>
            <artifactId>elasticjob-lite-spring-boot-starter</artifactId>
            <version>3.0.2</version>
</dependency>
```
4. 编写一个 MyJob 类并继承 SimpleJob
```java
@Component
public class MyJob implements SimpleJob {
    @Override
    public void execute(ShardingContext shardingContext) {
        System.out.println("SimpleJob:MyJob result is: xxx");
    }
}

```

5. 按要求修改配置文件 [application.yaml](https://shardingsphere.apache.org/elasticjob/current/cn/user-manual/elasticjob-lite/configuration/spring-boot-starter/)
[serverLists](https://shardingsphere.apache.org/elasticjob/current/cn/user-manual/elasticjob-lite/configuration/) 表示 ZooKeeper 的地址
```
elasticjob:
  regCenter:
    serverLists: localhost:2181
    namespace: elasticjob-lite-springboot

  jobs:
    simpleJob:
      elasticJobClass: cn.sxy21.elasticjob.job.MyJob
      timeZone: GMT+08:00
```

jobs 的配置项是否必填[参考文档](https://shardingsphere.apache.org/elasticjob/current/cn/user-manual/elasticjob-lite/configuration/spring-boot-starter/)


## 使用 RESTful API 管理作业
ElasticJob-Lite 提供了 [Java API](https://shardingsphere.apache.org/elasticjob/current/cn/user-manual/elasticjob-lite/usage/operation-api/)，可以通过直接对注册中心进行操作的方式控制作业在分布式环境下的生命周期。

1. 新建一个 config 类
```java
@Component
public class JobConfig {

    @Autowired
    private ZookeeperRegistryCenter zrc;

    @Bean
    public JobOperateAPI jobOperateAPI(){
        return new JobOperateAPIImpl(zrc);
    }

    @Bean
    public JobConfigurationAPI jobConfigurationAPI() {
        return new JobConfigurationAPIImpl(zrc);
    }
}
```

2. 新建一个 Controller 类
```java

@RestController
@RequestMapping("/jobs")
public class JobApiController {


    @Autowired
    private JobOperateAPI jobOperateAPI;

    @Autowired
    private JobConfigurationAPI jobConfigurationAPI;

    @GetMapping("/config")
    public String get(@RequestParam String name){
        JobConfigurationPOJO jobConfig =  jobConfigurationAPI.getJobConfiguration(name);
        return jobConfig.toString();
    }

    @GetMapping("/disable")
    public String stop(@RequestParam String name){
        jobOperateAPI.disable(name,null);
        return name;
    }

    @GetMapping("/enable")
    public String start(@RequestParam String name){
        jobOperateAPI.enable(name,null);
        return name;
    }
}
```

