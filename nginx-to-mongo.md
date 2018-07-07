---
title: 在CentOS上安装Fluentd实现把nginx日志存入mongo 
tags: ["Fluentd","nginx"]
date: 2018-06-26
---


下载官方安装脚本并启动：

```shell
wget https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh
chmod +x install-redhat-td-agent2.sh
./install-redhat-td-agent2.sh
systemctl start td-agent
```

查看日志

```shell
tail -f /var/log/td-agent/td-agent.log
```

配置
```shell
vi /etc/td-agent/td-agent.conf
```

文件内容如下，source为nginx日志格式化，match mongo为使用mongo存储

```nginx
<source>
  @type tail
  format /^(?<remote>[^ ]*) (?<host>[-]) (?<user>[^ ]*) \[(?<time>[^\]]*)\] "(?<method>\S+)(?: +(?<path>[^\"]*) +\S*)?" (?<code>[^ ]*) (?<size>[^ ]*) "(?<referer>[^\"]*)" "(?<agent>[^\"]*)"/
  time_format %d/%b/%Y:%H:%M:%S %z
  path /var/log/nginx/access.log
  pos_file /var/log/td-agent/nginx.access.pos
  tag mongo.nginx.access
</source>

<match mongo.**>
  type mongo
  database nginx
  collection access
  host 192.168.1.149
  port 47017
  flush_interval 10s
</match>
```

**配置文件说明:**

- type tail: tail方式是 fluentd 内置的输入方式，其原理是不停地从源文件中获取新的日志
- format nginx: 指定使用 fluentd 内置的 nginx 日志解析器。
- path /data/logs/nginx/access.log: nginx日志文件位置。
- pos_file /data/logs/nginx/access.log.pos:fluentd会把读取nginx日志并
- tag mongo.nginx: 指定tag，tag被用来对不同的日志进行分类
- type mongo:fluentd插件类型，这里是针对mongodb的插件
- database:数据库名字
- collection:表名
- host:主机
- port:端口，默认27017
- flush_interval:刷新间隔，10s写入一次数据


改了配置文件记得重启 

```shell
systemctl restart td-agent
```

**参考**
- [Installing Fluentd Using rpm Package](https://docs.fluentd.org/v0.12/articles/install-by-rpm)
- [MongoDB Output Plugin](https://docs.fluentd.org/v0.12/articles/out_mongo)
- [td-agent v1 vs. td-agent v2](https://docs.fluentd.org/v0.12/articles/td-agent-v1-vs-v2)
- [fluentd安装配置简介](http://mayiwei.com/2014/03/03/fluentd-setup/)
- [Getting Data From Nginx Into Mongo Using Fluentd](https://docs.fluentd.org/v0.12/articles/recipe-nginx-to-mongo)