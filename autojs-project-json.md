---
title:  autojs project.json 配置文件详解
heading: Auto.js 项目打包如何配置文件project.json
date: 2020-05-07T08:02:33.866Z
categories: ["code"]
tags: 
description: 
---

Auto.js 打包的配置文件详解

项目的配置文件为：project.json 

```json
{
    "name": "微x工具箱",
    "main": "main.js", 
    "ignore": [
        "build"
    ],
    "packageName": "com.sxy91.demo",
    "versionName": "1.0.0",
    "versionCode": 1,
    "encryptLevel": 1, // 加密类型，0不加密，1离线加密 2在线加密
    "icon": "res/icon.png", //app图标
    "launchConfig": {
        "displaySplash": true, // 显示启动界面
        "hideLogs": false, // 隐藏日志
        "splashIcon": "res/splashIcon.png", //启动界面图标
        "splashText": "欢迎关注公众号“下课了”", //启动界面文字
        "stableMode": false 
    },
    "optimization": {   //运行配置
        "removeOpenCv": true, // 不需要涂色模块
        "unusedResources": true //不需要内置图标包
    }
}
```

如果需要auto.js程序结束后显示所有日志，可以把日志级别配置到文件里。具体教程请参考[auto.js如何显示日志信息](https://sxy91.com/posts/autojs-log/)