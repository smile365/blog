---
title:  install-kinaba
heading: 
date: 2022-07-22T10:31:21.628Z
categories: ["code"]
tags: 
description: 
---

```bash
docker pull kibana:7.7.0
docker run -d --name kibana -p 5601:5601 kibana:7.7.0

#进入es容器内部
docker exec -it kibana /bin/bash
#修改es配置文件kibana.yml
vi /usr/share/kibana/config/kibana.yml
#添加以下内容
elasticsearch.username: "kibana"
elasticsearch.password: "*****"
#保存后退出docker容器
exit
#重启kibana
docker restart kibana
```





参考
- [kibana配置elasticsearch密码](https://blog.csdn.net/IT_road_qxc/article/details/121858843)