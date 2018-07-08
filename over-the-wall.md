---
title: 科学上网图文教程
date: 2018-01-26
tags: ["科学上网"]
description : 一份全平台支持的翻墙图文教程
cover: http://upload-images.jianshu.io/upload_images/1374969-2b60e6f0a92b0655.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
---

一份全平台支持的翻墙图文教程

![翻墙不易](http://upload-images.jianshu.io/upload_images/1374969-2b60e6f0a92b0655.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

 **科学上网**：指突破“防火长城”的封锁，到国外网络上查找学习资料的过程。

科学上网得用梯子，网络上俗称“代理”。代理可以理解为替你跑腿的人。你在宿舍出不去了，找了一个宿舍外的同学帮你去买吃的，他就是你的“代理 ”。综上所述，科学上网的目标是找一台能上国外网站的电脑，然后让他帮你把国外的内容给你取过来。

**目标：租一台国外的电脑**
即VPS，虚拟专用服务器，目前最便宜的vps基本是30美元一年。性价比最高的依次为：[搬瓦工](https://bwh1.net/aff.php?aff=24326)、[vultr](https://www.vultr.com/)、[Linode](https://www.linode.com/)。听说亚马逊和谷歌为学生提供免费使用一年的vps，同学们可以尝试。

搬瓦工一直以来便是最具性价比的科学上网方案，可以通过网页一键安装科学上网所需的软件（Shadowsocks Server），极力推荐小白用户使用，已经支持支付宝付款。

**第一步：注册账号并购买**
用了三年搬瓦工还算稳定，本教程以搬瓦工为例，[10G套餐](https://bwh1.net/aff.php?aff=24326) 基本抢不到，一般购买[20G套餐](https://bwh1.net/aff.php?aff=24326&gid=1)的（点击蓝色链接购买，用这个优惠码还能再省6% ： BWH1ZBPVK）。一定要点击验证码，否则不会有优惠！

![使用优惠码](http://upload-images.jianshu.io/upload_images/1374969-6ea007ab7511c076.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

支付成功后邮箱里会收到：服务器IP、ssh端口等信息。在官网点击右上角Client Area进行登录。依次点击 Service、My service、Control Panel进入控制面板。

![进入控制面板](http://upload-images.jianshu.io/upload_images/1374969-57cd9de9303630ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**第二步：安装Shadowsocks Server（ss服务端）**

点击 Shadowsocks Server进行安装，成功后会显示ss的加密方式、端口、和密码。注意保存，下一步会用到。

![安装服务端](http://upload-images.jianshu.io/upload_images/1374969-ba14d089261c9872.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**第三步：安装Shadowsocks Clinent （客户端）**

下载相应的客户端（[安卓](https://github.com/shadowsocks/shadowsocks-android/releases)、[ios](https://github.com/shadowsocks/shadowsocks-iOS/releases)、[window](https://github.com/shadowsocks/shadowsocks-windows/releases)、[mac](https://github.com/shadowsocks/ShadowsocksX-NG/releases)或[Linux](https://github.com/shadowsocks/shadowsocks-qt5/releases)）进行安装。安装完成后填写第二步生成的加密方式、端口和密码就完成了。官方还附赠了科学上网的客户端教程，真是贴心。

![填写密码](http://upload-images.jianshu.io/upload_images/1374969-7be799614a30354c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



**ps**:安卓用户推荐安装[谷歌Play](https://play.google.com/)、找好玩的应用就不愁了。记得跟百度说再见吧，用了谷歌根本回不去。
**pps**：如果你选择了不带KVM控制面板的vps，那么你需要通过命令安装ss服务端。
**ppps**：我真的只是学习，真的没有大人能看的网站。

有什么问题欢迎微信交流：**smile8365**

今天就写到这里，后续教程计划：
1、通过命令安装Shadowsocks Server
2、[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)插件的使用。
3、把家里的智能路由器打造成vpn。