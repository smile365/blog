---
title: mongo服务因磁盘无法写入而异退出的解决方法
tags: ["mongo","Linux"]
draft: true
---

1.使用`ps -ef|grep mongod `查看已经没有了mongod的服务进程
2.使用`tail -f /var/log/mongodb/mongod.log`查看日志信息，发现并没有错误信息，最后一条消息只显示了一个时间.
3.使用`mongod -f /etc/mongod.conf`启动失败，mongod.log里也并未增加任何运行日志 

初步判断是mongo无法写入文件了。
使用命令补全(tab键)时提示：`va-bash: 无法为立即文档创建临时文件: 设备上没有空间`

使用命令`df -h`查看分区占用情况，发现挂载点为"/"已使用100%。


![分区情况](https://i.loli.net/2018/07/04/5b3cb1b8a30f7.jpg)

解决方式，把mongo的数据文件和日志文件迁移到其他挂载点(home)
```shell
mkdir /home/lib /home/log
mv /var/lib/mongod /home/lib
mv /var/log/mongod /home/log
```

修改mongo的配置文件，指定日志文件和数据文件路径

![/etc/mongod.conf](https://i.loli.net/2018/07/04/5b3cb1da283f4.jpg)

再次查看分区占用情况

![分区情况](https://i.loli.net/2018/07/04/5b3cb1f3d4b34.jpg)


使用`mongod -f /etc/mongod.conf `启动mongodb能正常启动

> 

**总结：**
* 使用`df -h`查看所有挂载点。
* 使用`ls /`查看目录为"/"下的所有文件和目录。与上一步比较，不在挂载点的都属于"/"，这些目录* 类似于windows的系统盘，所以尽量不要安装服务或存放数据。
* 安装相关服务时必须指定数据的存放路径和日志路径，且尽量不要指定为系统目录。

重灾区：/var/lib，/var/log，/usr/local

**需要注意的服务**:
* nginx日志，建议使用新版，会自动按天分割日志，并归档压缩。
* mysql/redis/mongo等数据库的数据文件和日志文件。
* tomcat日志，建议配置按天分割。




