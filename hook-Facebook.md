---
title:  使用xposed框架hook安卓端Facebook
date: 2018-12-07T08:28:28.379Z
tags: ["code","it"]
categories: ["code"]
description:
---

**关于Xposed**  

Xposed 框架是一款可以在不修改APK的情况下影响程序运行（修改系统）的框架服务，基于它可以制作出许多功能强大的模块，且在功能不冲突的情况下同时运作。
（安装需 root 权限，5.0 后只能从定制 recovery 中刷入）

**基本原理**  

Zygote进程是Android的核心，所有的应用程序进程以及系统服务进程都是由Zygote进程fork出来的。Xposed Framework 深入到了Android核心机制中，通过改造 Zygote 来实现一些很牛逼的功能。Zygote的启动配置在/init.rc 脚本中，由系统启动的时候开启此进程，对应的执行文件是/system/bin/app_process，这个文件完成类库加载及一些初始化函数调用的工作。当系统中安装了 XposedFramework之后，会拿自己实现的app_process 覆盖掉Android原生提供的文件，使得app_process在启动过程中会加载XposedBridge.jar这个jar包，从而完成对Zygote进程及其创建的Dalvik虚拟机的劫持。

**劫持token的思路**  
app一般的流程为：
>填写账号密码-->登录-->服务器返回token-->app接收到token并保存-->下次获取数据携带token。

- 方法一：拦截http请求
- 方法二：拦截存储token（数据库sqlite，SharedPreference）
- 方法三：拦截token的数据操作（map,json）


**不root手机使用Xposed**  

[VirtualXposed](https://github.com/android-hacker/VirtualXposed/releases)是基于VirtualApp和epic在非ROOT环境下运行Xposed模块的实现（支持5.0~9.0)。安装vx后，开发的插件即可在非root环境下运行。


Xposed的插件开发请自行搜索，本次主要测试了sqlite、http、sp、socket几种方式的hook。最终在socket的hook中获取到了token。开发好插件后，使用方式如下：

登录Facebook后在vx中开启开发好的插件，然后通过Android Studio即可看到hook到的token。

插件中主要的类如下：

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1582171153887.png)


> ps：微信搜索公众号「**下课了**」，回复「hook」进入开发交流群，一起学习。有疑问可在群里提问。   
> ![微信扫一扫](https://gitee.com/smile365/blogimg/raw/master/sxy91/1582087774482.png)


参考  

- [xposed-api](https://api.xposed.info/reference/packages.html)
- [XposedBridge-tutorial](https://github.com/rovo89/XposedBridge/wiki/Development-tutorial)
- [Hook机制](https://github.com/tiann/understand-plugin-framework)
- [运行时AOP](http://weishu.me/2017/11/23/dexposed-on-art/)
- [Xposed 插件开发](https://blog.csdn.net/niubitianping/article/details/52575900)