---
title:  使用docker快速体验hbase
date: 2019-04-15T08:10:30.889Z
tags:
 - docker
 - hbase
categories:
 - code
description:
---

学习大数据相关技术的时候往往离不开hbase，用docker快速运行hbase是一个不错的选择。

----------
如果没有安装docker可以参考这里[先安装docker](https://www.sxy91.com/posts/docker/)  

然后拉取镜像[hbase-docker](https://github.com/dajobe/hbase-docker)
```shell
#拉取镜像
docker pull dajobe/hbase
#创建存储路径
cd ~ && mkdir data
#后台运行，镜像名为hbase-docker，可以自定义
docker run --name=hbase-docker -h hbase-docker -d -v $PWD/data:/data dajobe/hbase
#先查看镜像的虚拟ip
docker inspect hbase-docker |grep IPAddress
#把上一步查询到的虚拟ip加入到当前电脑的host(我的是172.17.0.2)
echo "172.17.0.2 hbase-docker hbase-docker" >> /etc/hosts
```

安装完后可以在docker中使用hbase-shell等命令

测试`status\list\create`等[hbase命令](https://www.tutorialspoint.com/hbase/hbase_shell.htm)  

```
$ docker exec -it  hbase-docker hbase shell
$ create 'my_table', {NAME => 'cf', COMPRESSION => 'SNAPPY'},{SPLITS => ['2','5','8','b','e']}
```

浏览器查看Hbase的web界面
```bash
假设安装docker的电脑ip为`192.168.31.235`

那么直接打开网页即可：`http://192.168.31.235:16010/master-status`
```


如果docker没有安装在本机，而是安装在其他服务器上，或者使用VMware/VirtualBox等安装在远程电脑上。
比如ip为192.168.31.235，hostname为myserver。

在myserver服务器上编辑文件`vim ~/.ssh/config`，内容如下：  
```bash
Host myserver
Hostname 192.168.31.235
    LocalForward *:16010 hbase-docker:16010
    LocalForward *:9095 hbase-docker:9095
    LocalForward *:8085 hbase-docker:8085
    LocalForward *:9090 hbase-docker:9090
```

防火墙打开相应端口，然后在myserver上执行`ssh myserver`

即可访问hbase的web页面：`http://192.168.31.235:16010/master-status`


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


参考  
- [SSH LocalForward](http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html)
- [SSH Config](https://deepzz.com/post/how-to-setup-ssh-config.html)
- [SSH端口转发](https://www.cnblogs.com/520yang/articles/5405323.html)
