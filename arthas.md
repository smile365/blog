


# 如何使用 arthas 分析 java oom 问题

## 前言

一个 spring boot 的容器经常被重启。原因是 OOMKilled。


查看 pods 发现 52ckf 重启过一次
```log
sxy@sxydeMacBook-Air> kubectl get pods |grep mypodname                                           
mypodname-66dc444b55-52ckf                   1/1     Running            1 (9m52s ago)      4h32m
```

查看重启前的日志，程序被 killed 了
```
sxy@sxydeMacBook-Air testing % kubectl logs mypodname-66dc444b55-52ckf  --previous
2023-10-08 10:11:40.050  WARN 7 --- [nio-8080-exec-2] c.n.c.c.h.ClientBase                     : Unable to invoke Conductor API with uri: http://server:8080
Killed
```

查看被 killed 的原因为 OOMKilled，退出代码 137 表示应用程序遇正常，但容器由于内存不足而被名为 OOM Killer 的 Linux 内核进程杀死。
```
sxy@sxydeMacBook-Air testing % kubectl describe pod mypodname-66dc444b55-52ckf
Name:             mypodname-66dc444b55-52ckf
  Reason:       OOMKilled
  Exit Code:    137
```


## 安装 arthas
参考[arthas官网](https://arthas.aliyun.com/doc/install-detail.html)
进入容器 
```bash
curl -O https://arthas.aliyun.com/arthas-boot.jar
java -jar arthas-boot.jar

# 提示“找不到 java 程序”错误
[INFO] JAVA_HOME: /usr/local/openjdk-11
[INFO] arthas-boot version: 3.7.1
[INFO] Can not find java process. Try to run `jps` command lists the instrumented Java HotSpot VMs on the target system.
Please select an available pid.

# 使用 jps 查看进程 id
jps
# sh: 4: jps: not found

# 使用 ps 查看进程 id
ps -ef
# sh: 6: ps: not found

# 安装 ps 命令
apt update
apt install -y procps

# 查找到 java 程序的 pid 为 7
ps -ef



# 运行 arthas
java -jar arthas-boot.jar 7

# 出现错误 Error: Unable to initialize main class com.taobao.arthas.core.Arthas
Picked up JAVA_TOOL_OPTIONS:
Error: Unable to initialize main class com.taobao.arthas.core.Arthas
Caused by: java.lang.NoClassDefFoundError: com/sun/tools/attach/AgentLoadException
[ERROR] attach fail, targetPid: 7

```

## 重新修改 dockerfile 支持 jps 和 jmap 命令
参考[官网解释](https://arthas.aliyun.com/doc/docker.html#%E5%9C%A8-docker-%E9%87%8C%E4%BD%BF%E7%94%A8-jdk)，应用在 docker 里出现 arthas 无法工作的问题，是因为应用没有安装 JDK ，而是安装了 JRE 。如果只安装了 JRE，则会缺少很多 JAVA 的命令行工具和类库，Arthas 也没办法正常工作。

修改 dockerfile 如下：
```paintext
# 构建
FROM maven:3.8.4-openjdk-11 AS builder
RUN mvn clean package -DskipTests=true
...

# only JRE
#FROM  openjdk:11-jre

# JDK&JRE
FROM  openjdk:11
RUN mkdir /app

WORKDIR /app
COPY --from=builder /target/*.jar /app/myapp-starter.jar
...
```


## 导出堆内存快照

```bash
# 使用 jps 查看 pid
> jps
7 starter.jar

# jmap -dump:format=b,file=<输出文件路径> <进程ID>
> jmap -dump:format=b,file=myapp-001.hprof 7
> ls -lh 
2.3G myapp-001.hprof
```

## 使用 arthas 查看方法的调用路径


```java
package com.netflix.conductor.core.execution;

@Component
public class AsyncSystemTaskExecutor {

    public void execute(WorkflowSystemTask systemTask, String taskId) {
        //...
    }
}
```

```bash
stack com.netflix.conductor.core.execution.AsyncSystemTaskExecutor execute

# 输出如下
    @com.netflix.conductor.core.execution.AsyncSystemTaskExecutor.execute()
        at com.netflix.conductor.core.execution.tasks.SystemTaskWorker.lambda$pollAndExecute$1(SystemTaskWorker.java:135)ts=2023-10-17 22:11:04;thread_name=system-task-worker-13;id=ac;is_daemon=false;priority=5;TCCL=org.springframework.boot.loader.LaunchedURLClassLoader@2eed37f4        at com.netflix.conductor.core.execution.tasks.SystemTaskWorker.lambda$pollAndExecute$1(SystemTaskWorker.java:135)        at com.netflix.conductor.core.execution.tasks.SystemTaskWorker.lambda$pollAndExecute$1(SystemTaskWorker.java:135)
```

最终定位到代码
```java
package com.netflix.conductor.core.execution.tasks;

public class SystemTaskWorkerCoordinator {

    @EventListener(ApplicationReadyEvent.class)
    public void initSystemTaskExecutor() {
        this.asyncSystemTasks.stream()
                .filter(this::isFromCoordinatorExecutionNameSpace)
                .forEach(this.systemTaskWorker::startPolling);
        LOGGER.info(
                "{} initialized with {} async tasks",
                SystemTaskWorkerCoordinator.class.getSimpleName(),
                this.asyncSystemTasks.size());
    }
        
}
```


```bash
trace com.netflix.conductor.core.execution.AsyncSystemTaskExecutor execute
```





## 不重启反编译线上的 java 代码并使用


```log
vim /tmp/ParametersUtils.java

java -jar arthas-boot.jar
sc -d *ParametersUtils | grep classLoaderHash
mc -c 2eed37f4 /tmp/ParametersUtils.java -d /tmp
# 输出 /tmp/com/netflix/conductor/core/utils/ParametersUtils.class
redefine /tmp/com/netflix/conductor/core/utils/ParametersUtils.class
```


参考[Arthas实践--jad/mc/redefine线上热更新一条龙](https://github.com/alibaba/arthas/issues/537)




