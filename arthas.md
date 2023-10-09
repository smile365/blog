


# 如何使用 arthas 分析 java oom 问题

## 前言

一个 spring boot 的容器经常被重启。原因是 OOMKilled。


查看 pods 发现 52ckf 重启过一次
sxy@sxydeMacBook-Air> kubectl get pods |grep mypodname                                           
mypodname-66dc444b55-52ckf                   1/1     Running            1 (9m52s ago)      4h32m


查看重启前的日志，程序被 killed 了
sxy@sxydeMacBook-Air testing % kubectl logs mypodname-66dc444b55-52ckf  --previous
2023-10-08 10:11:40.050  WARN 7 --- [nio-8080-exec-2] c.n.c.c.h.ClientBase                     : Unable to invoke Conductor API with uri: http://server:8080
Killed

查看被 killed 的原因为 OOMKilled，
sxy@sxydeMacBook-Air testing % kubectl describe pod mypodname-66dc444b55-52ckf
Name:             mypodname-66dc444b55-52ckf
  Reason:       OOMKilled
  Exit Code:    137
退出代码 137 表示应用程序遇正常，但容器由于内存不足而被名为 OOM Killer 的 Linux 内核进程杀死。

## 安装 arthas
参考[arthas官网](https://arthas.aliyun.com/doc/install-detail.html)
进入容器 
```bash
curl -O https://arthas.aliyun.com/arthas-boot.jar
java -jar arthas-boot.jar

jps
jmap
apt install procps
```



