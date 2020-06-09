---
title:  2020最新科学上网方法教程
heading: 2020安卓手机和pc端如何挂梯子科学上外网方法教程
date: 2020-06-09T02:35:19.504Z
categories: ["tools"]
tags: ["科学上网","如何科学上外网"]
description: 
---

很多小伙伴需要到外网查找学习资料，看李子柒在油管的视频，做跨境电商业务等。但是由于某些众所周知的原因，这些网络在国内无法访问。这时候就需要我们掌握一定的科学上网知识。

### 1.准备工作

首选你需要一台在海外的服务器，简称vps，主要用来搭建梯子。vps提供商也很多，质量层次不齐，价格也很混乱，很多小白容易花高价买到低质的服务器。对比了十几家vps提供商，目前性价比最高的为以下三款：

| 配置 | 年付价格 | 推荐星级 | 说明 |
| ---- | ---- | ---- |---- |
|  hostodo[普通款](https://hostodo.com/portal/cart.php?aff=844&gid=44)   |  $19.99    | 🌟🌟🌟 | 速度适中，适合不看视频的同学    |
|  hostodo[亚洲优化款](https://hostodo.com/portal/cart.php?aff=844&gid=36)    |   $25   | 🌟🌟🌟🌟   |  速度较快，接近搬瓦工，看视频流畅   |
|  搬瓦工[高速网络直连版](https://bwh88.net/aff.php?aff=24326)    |   $49.99   | 🌟🌟🌟🌟🌟     |速度最快， 看高清视频无卡顿   |

这两家不定期有促销活动，欢迎加入QQ群，有优惠码会在群里发放。<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=0205580283f1d4211435b84db108766d9175a6c842da5d21dfba59ae5422461b"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="微x工具箱讨论群" title="微x工具箱讨论群"></a>


### 2.安装所需软件

[购买vps](https://sxy91.com/posts/hostodo/)成功后会收到ip地址和账号密码，需要通过[ssh工具](https://sxy91.com/posts/over-the-wall-2/)连接到vps。

无论是ss还是ssr或是其他软件，底层传输用的都是tcp协议，目前大多数tcp连接都被防火墙阻断了。因此需要修改底层协议才能梯子才能正常使用。目前较为可行的底层协议为udp/socket/cdn三种方式。把tcp协议转换成其他协议的软件也有很多，较为稳定的是实现了KCP传输协议相关的软件。目前我用的也是这种方式，稳定运行两年暂未遇到问题。

动手能力强的同学欢迎参考[科学上网安装和配置教程](https://sxy91.com/posts/over-the-wall-2/)，安装所需软件。

vps需要两个软件：

通过pip安装shadowsocks  
```bash
# 安装pip，通过pip安装shadowsocks
pip -V
yum -y install wget
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install shadowsocks
```

安装kcptun-linux   
```bash
# wget +复制的下载链接进行下载。如：
wget https://github.com/xtaci/kcptun/releases/download/v20190924/kcptun-linux-amd64-20190924.tar.gz
# 解压：
tar zxvf kcptun-linux-amd64*.tar.gz
```


如果嫌上面的教程太麻烦，我写了一个全自动安装脚本，有需要的同学私聊微信`smile8365`发给你，暂不公开提供。





