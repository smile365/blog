---
title: JavaScript新手入门第1课 
heading: 
date: 2020-01-16T02:29:49.898Z
categories: ["life"]
draft: true
tags: 
description: 
---

### 1 下载所需工具
- [chrome](https://pc.qq.com/detail/1/detail_2661.html)，谷歌开发的一款浏览器。
- [vscode](https://code.visualstudio.com/download)，微软开发的一款写代码的工具。



JavaScript代码需要浏览器来运行，用来控制网页的各种行为。

浏览器地址栏访问的是网页，因此JavaScript需要放到网页里。

### 2 先创建1个网页

在电脑本地硬盘任意位置，右键新建一个文件夹`day1`，用vscode打开此文件夹，点击`new file`,内容如下:
```html
<html>
    <title>我的第一个网页</title>
    <body>
        <h1>我的第一个标题</h1>
        <p>我的第一个段落。</p>
    </body>
</html>
```
点击保存为文件`index.html`,右键选择`Reveal in Finder`或者`Reveal in Explorer`, 然后双击打开看看效果。（ps：或者拖动到chrome浏览器）

### 3 把JavaScript代码放到网页里

接下来如何把JavaScript放到index.html里呢，有两种方式

方式1，直接写到index.html里，代码如下:
```html
<html>
    <head>
       <title>我的第一个网页</title> 
    </head>
    <meta charset="utf-8">
    <body>
        <h1>我的第一个标题</h1>
        <p>我的第一个段落。</p>
    </body>
    
    <script>
            console.log("这里是JavaScript代码，用chrome打开，按f12，点击console即可看到我"); //打印日志
            // document.body.innerText = "你好呀 JavaScript"; // “//”代表注释，取消注释保存后，重新刷新浏览器看看效果
    </script>
</html>
```


方式2，点file-->new file




