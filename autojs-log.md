---
title:  auto.js如何显示日志和调试信息
heading: autojs显示日志悬浮框并打印和显示日志信息
date: 2020-04-29T01:26:59.943Z
categories: ["code"]
tags: ["autojs 7.0下载","autojs"]
description: 手机autojs菜鸟教程，Auto.js Pro图文教程	
---

autojs的文档没有pdf格式可供下载，只能去看网页版官方文档地址：`https://hyb1996.github.io/AutoJs-Docs`。文档支持Auto.js 4和auto.js pro7两个版本。作者hyb1996还没来得及写Auto.js 8.0 pro的文档，如果你用的是auto.js pro8只能自己研究。

我目前用的是autojs 7.0 pro，可以到这里[下载Auto.js app](https://www.sxy91.com/posts/autojs/)


使用autojs写脚本的时候，最需要的就是调试信息，不然无法知道出错的信息。一般打印日志的方法是log、print、console等。但在手机上如何显示呢。

下面的autojs命令代码支持autojs 4.1.0和auto.js pro7。

```javascript
// 会在手机显示一个控制台，打印的信息会在手机端显示（需要开启悬浮窗权限）
// autojs在手机端显示调试信息，也就是日志
console.show();
//autojs打印日志调试信息的各种方法
log("如何用autojs打印白色的日志");
print("这个日志也是白色的");
console.verbose("这个调试信息是灰色的");
console.info("autojs的日志变绿色了");
console.warn("蓝色的调试信息");
console.error("红色的调试信息");
//还支持吧日志信息输出到文件
console.setGlobalLogConfig({
    "file": "/sdcard/autojs-log.txt"
});
```







