---
title:  autojs跳转到群
heading: auto.js如何跳转到群
date: 2020-04-24T02:55:34.942Z
categories: ["code"]
tags: ["Auto.js教程","Auto.js跳转到QQ群","Auto.js自动跳转到个人QQ页面","Auto.js intent"]
description:  auto.js intent qq群
---

Android的意图和广播可用来跳转到其他app和传递数据。下面介绍一下Auto.js关于意图和广播的一些使用方法。Auto.js借助intent可以跳转到其他应用的界面。

**脚本例子1：Auto.js跳转到个人QQ界面**   
方便添加QQ好友联系人。
```javascript
// 打开QQ的个人界面
//testqq="931918906"
function toQQ(qq){
    if(!qq) qq="931918906";
    app.startActivity({
        action: "android.intent.action.VIEW",
        data: "mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=" + qq,
    });
}
```

**脚本例子2：Auto.js跳转到QQ群界面**   
方便添加QQ群，加入群聊。
```javascript
// 打开QQ群
// testkey = "49zbWmn0Bwnde1m_p6RuOlHB9IivoEIk";
function toQqGroup(key){
    if(!key) key = "49zbWmn0Bwnde1m_p6RuOlHB9IivoEIk";
    app.startActivity({
                action: "android.intent.action.VIEW",
                data: "mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26k%3D" + key
    });
}
```

**脚本例子3：Auto.js跳转到QQ群的自动接龙界面**   
若没有加入QQ群，得先加入QQ群。
```javascript
// 自动跳转到QQ群的群接龙游戏
// testqqgroup = "1003185728"
function qunSolitaire(qqgroup){
    if(!qqgroup) qqgroup = "1003185728";
    var url = base64("https://qun.qq.com/homework/qunsolitaire/list.html?_wv=1031&gc="+qqgroup+"&from=appstore_icon&from=qqminiprogram="+ qqgroup + "&state=1");
    app.startActivity({
            action: "android.intent.action.VIEW",
            data: "mqqapi://forward/url?url_prefix=" + url + "&version=1&src_type=web"
    });
}
```
有疑问欢迎加入AutoJs的交流QQ群提问：`1003185728`。



QQ自动点赞脚本

请登录后操作。（引导到微信公众号关注，发送邀请码等）
积分兑换，淘宝客，变现。直接支付下载6.66
xpay，支付1.66元，自动把以下代码发送到你的邮箱。


autojs写的QQ群批量签到脚本源代码

auto.js qq群的相关搜索
Tasker Auto .js

Hyb1996 auto js
Auto js 连接电脑
Auto js 打包apk
Auto js 王者荣耀
Auto.js docs
Auto.js 截图
Auto.js 破解
Auto.js 录制
Auto.js 启动app
Auto.js 无障碍
Auto js API

auto.js  删除死粉
auto.js  删除僵尸粉



autojs下载官网		autojs老版本		autojs最新版
autojs脚本大全		auto.js pro破解版		autojs安卓脚本大全
autojs老版本下载		钉钉自动签到插件		autojs免费版下载

