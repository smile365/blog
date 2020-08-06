---
title:  Linux根目占满造成无法自动补全命令的解决方法
date: 2019-05-05T03:26:43.089Z
tags: 
 - linux
categories: ["code"] 
---


使用命令补全(tab键)时提示：
>-bash: cannot create temp file for here-document: No space left on device
ls -bash: 无法为立即文档创建临时文件: 设备上没有空间
-bash: 无法为立即文档创建临时文件: 设备上没有空间

查看挂载点占用情况：`df -h`  

![磁盘占用](https://i.loli.net/2019/05/05/5cce5839406f5.jpg)

 
查看占用超过1g的目录:`du -sh * |grep -E 'G|T'`    
![目录大小](https://i.loli.net/2019/05/05/5cce639bdd203.jpg)

>注：不在上图中挂载点的目录(usr/var/root)都属于/挂载点 

大多数情况为数据或日志等文件过多造成的。 比如mongo、docker、redis
![enter description here](https://i.loli.net/2019/05/05/5cce641f9412a.jpg)


**迁移mongo数据**

查看mongo配置文件：`cat /etc/mongod.conf`

停止mongo服务：`systemctl stop mongod`

迁移数据文件：
```sh
mv /var/lib/mongo /home/sharefile/mongo 
echo "" > /home/sharefile/mongo/mongod.log
```

修改配置文件：`vim /etc/mongod.conf`
```yaml
# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  #path: /var/log/mongodb/mongod.log
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  #dbPath: /var/lib/mongo
  dbPath: /home/sharefile/mongo
```
重启服务:`mongod -f /etc/mongod.conf`

测试：`mongo localhost:47017`


**迁移docker数据**
按照教程[配置docker存储路径](https://sxy91.com/posts/docker/))
```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "data-root": "/home/softdata/docker",
  "registry-mirrors": [
    "https://dockerhub.azk8s.cn",
    "https://reg-mirror.qiniu.com"
  ]
}
EOF
sudo systemctl stop docker
sudo rsync -aP /var/lib/docker/ /path/to/your/docker
sudo mv /var/lib/docker /var/lib/docker.old
systemctl start docker
#测试通过后可删除备份文件
#sudo rm -rf /var/lib/docker.old
```

**总结**： 
使用yum install方式安装的文件需要注意日志文件/数据文件等的路径，安装前配置一个容量大的目录。


参考  

- [linux磁盘占用问题](https://blog.csdn.net/nciasd/article/details/51497817)
- [mongo因磁盘无法写入而异退出](https://github.com/smile365/blog/blob/master/start-mongod-failed.md)
- [move docker lib](https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/)
