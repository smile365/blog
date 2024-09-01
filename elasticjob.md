---
title: "ElasticJob 教程"
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

## 运维平台和 RESTFul API 部署

[elasticjob-ui](https://github.com/apache/shardingsphere-elasticjob-ui)是 ElasticJob 的管理控制台，包含了动态配置、作业管控等功能。需要使用 jdk 1.8 编译和运行。


1. 编译

法一：直接下载编译好的二进制包

下载 [apache-shardingsphere-${version}-shardingsphere-ui-bin.tar.gz](https://archive.apache.org/dist/shardingsphere/) 解压后执行 `bin/start.sh`



法二：使用 jdk1.8 编译

```bash
git clone https://github.com/apache/shardingsphere-elasticjob-ui.git

cd shardingsphere-elasticjob-ui/

# 在配置文件 shardingsphere-elasticjob-lite-ui/shardingsphere-elasticjob-lite-ui-backend/src/main/resources/application.properties
# 取消注释
dynamic.datasource.allowed-driver-classes={'org.h2.Driver','org.postgresql.Driver'}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_341.jdk/Contents/Home

mvn clean package -Prelease
```

解压 elasticjob-lite-ui-bin.tar.gz 运行 `bin/start.sh`


2. 打开浏览器访问 http://localhost:8088/ 即可访问控制台，可通过启动脚本输入 -p 自定义端口号。


