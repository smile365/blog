---
title: 在CentOS上安装Fluentd实现把nginx日志存入mongo 
tags: 新建,模板,小书匠
grammar_cjkRuby: true
---


下载官方安装脚本并启动：
```
wget https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh
chmod +x install-redhat-td-agent2.sh
./install-redhat-td-agent2.sh
systemctl start td-agent
```
查看日志
```
tail -f /var/log/td-agent/td-agent.log
```

配置
```
vi /etc/td-agent/td-agent.conf
```

文件内容如下，source为nginx日志格式化，match mongo为使用mongo存储
```
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
重启 
```
systemctl restart td-agent
```

参考
[Installing Fluentd Using rpm Package](https://docs.fluentd.org/v0.12/articles/install-by-rpm)
[MongoDB Output Plugin](https://docs.fluentd.org/v0.12/articles/out_mongo)
[td-agent v1 vs. td-agent v2](https://docs.fluentd.org/v0.12/articles/td-agent-v1-vs-v2)
[fluentd安装配置简介](http://mayiwei.com/2014/03/03/fluentd-setup/)
[Getting Data From Nginx Into Mongo Using Fluentd](https://docs.fluentd.org/v0.12/articles/recipe-nginx-to-mongo)