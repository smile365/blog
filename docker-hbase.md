---
title:  使用docker快速体验hbase
date: 2019-04-15T08:10:30.889Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

docker快速运行hbase
----------
[先安装docker](https://github.com/smile365/blog/blob/master/docker.md)  

然后拉取镜像[hbase-docker](https://github.com/dajobe/hbase-docker)
```shell
docker pull dajobe/hbase
cd ~ && mkdir data
docker run --name=hbase-docker -h hbase-docker -d -v $PWD/data:/data dajobe/hbase

docker inspect hbase-docker |grep IPAddress
echo "172.17.0.2 hbase-docker hbase-docker" >> /etc/hosts

```

如果docker没有安装在本机，而是安装在myserver上(ip:192.168.31.235)，可在myserver服务器上编辑`vim ~/.ssh/config`，内容如下：  
```dsconfig
Host myserver
Hostname 192.168.31.235
    LocalForward *:16010 hbase-docker:16010
    LocalForward *:9095 hbase-docker:9095
    LocalForward *:8085 hbase-docker:8085
    LocalForward *:9090 hbase-docker:9090
```

防火墙打开相应端口，然后在myserver上执行`ssh myserver`

浏览器打开：http://192.168.31.235:16010/master-status


使用python连接hbase
----------

    $ pip install cython thriftpy happybase
    
```python
import happybase
server = '192.168.31.235'
connection = happybase.Connection(server, 9090)
connection.create_table('table-name', { 'family': dict() } )
connection.tables()
table = connection.table('table-name')
table.put('row-key', {'family:qual1': 'value1', 'family:qual2': 'value2'})
for k, data in table.scan():
	print(k, data)

```

使用hbase-shell
----------
测试status\list\create等命令  

    $ docker exec -it  hbase-docker hbase shell
    $ create 'test_table','cf',{VERSIONS=>1,COMPRESSION=>'SNAPPY',SPLITS => ['5','a','e','i','m','q','v']}

参考  
- [SSH LocalForward](http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html)
- [SSH Config](https://deepzz.com/post/how-to-setup-ssh-config.html)
- [SSH端口转发](https://www.cnblogs.com/520yang/articles/5405323.html)
