---
title:  autojs使用教程手册
date: 2019-07-08T01:28:44.819Z
tags: ["autojs输入文字","anto.js 切换应用","	auto.js 运行日志","auto.js布局分析的使用方法"]
categories: ["code"]
description:  如何用auto.js控制新浪微博和微信，自动点赞评论。
---

[auto.js](https://hyb1996.github.io/AutoJs-Docs/#/)是hyb1996在上中山大学期间开发的一款手机辅助软件。

主要版本如下：

- Auto.js 4.0：免费版本，不需要账号（目前已被作者下架，）
- Auto.js 7.0 pro：收费版，需要购买账号（不再更新，且关闭购买通道）
- Auto.js 8.0 pro：收费版，需要购买账号（目前正式版本）

> 可搜索微信公众号“下课了”，回复“autojs”获取以上各个版本的下载链接，若没有账号的同学请安装免费版。

在手机上写代码不方便，一般在电脑搭建auto.js环境。以下是Auto.js教程：

**autojs使用教程**

1. 手机下载并安装autojs.app

2. 电脑端安装[Auto.js-VSCodeExt](https://github.com/hyb1996/Auto.js-VSCode-Extension)： 

    - 在VS Code中菜单"查看"->"扩展"->输入"Auto.js"或"hyb1996"搜索，即可看到"Auto.js-VSCodeExt"插件，安装即可。

3. 打开一个空白的文件夹，按 `Ctrl+Shift+P` 或点击"查看"->"命令面板"，输入 `Auto.js`可调出命令面板。依次新建项目和启动服务。

4. 在手机端[Auto.js-app](https://www.coolapk.com/apk/129872)侧拉菜单中启用调试服务，并输入电脑端的IP地址，等待电脑端显示连接成功。

5. fn+f5测试刚刚新建的项目

6. 手机端开启悬浮窗可打开界面分析工具。

7. 要显示来自Auto.js的日志，打开 VS Code上面菜单的"帮助"->"切换开发人员工具"->"Console"即可。

8. 如需打包autojs开发好的app：在手机端点击脚本的...按钮->点击更多，即可打包。


**学习资料**  

> ps：微信搜索公众号「**下课了**」，回复「autojs」下载Auto.js app。   
> ![微信扫一扫](https://gitee.com/smile365/blogimg/raw/master/sxy91/1582087774482.png)

**用autojs实现的微信僵尸粉检测**

- [微信双向删除好友](https://www.sxy91.com/posts/wxtool/)

有问题请在下方留言。