---
title:  windows server 2012 配置多个账户实现多用户同时登录远程桌面
heading: windows server 2012 配置多个账户实现多用户同时登录远程桌面
date: 2020-06-16T06:23:19.495Z
categories: ["code"]
tags: 
description:  windows server 2012 r2 multiple remote desktop sessions
---

配置组策略

右键左下角的windows，点击"运行"，输入“gpedit.msc”回车。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592288856169.png)

依次打开，计算机配置–>管理模板—>windows组件—>远程桌面服务->远程桌面会话主机->连接，设置如下

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592289084052.png)

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592289189522.png)


打开Internet Explorer浏览器,在地址栏中输入https://activate.microsoft.com这个地址，语言选择中文，点击下一步

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592289433770.png)


右键“这台电脑”->点击“属性”


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592289482322.png)

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592289590384.png)



![](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592294027623.png)


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1592294459489.png)

此时使用 
mstsc /v:ip地址:端口 /admin

命令可以登录远程服务器

