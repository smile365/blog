---
title:  mac os环境下运行'ls -al'后出现“+”或“@“标记
heading: mac环境使用xattr命令查看带有“@”标记的文件
date: 2020-04-22T03:56:42.032Z
categories: ["code"]
tags: ["mac xattr","mac ls -lh @"]
description: + or @ mark after running 'ls -al' 
---

mac环境下用python读取文件的时候发现错误：`
PermissionError: [Errno 13] Permission denied: 'WechatIMG23.jpeg`

使用`ls -lh .img/`命令查看文件，发现多了“@”标志
```bash
-rw-r--r--@ 1 songyangcong  staff    87K  4 22 11:16 WechatIMG22.jpeg
-rw-r--r--@ 1 songyangcong  staff   124K  4 22 11:16 WechatIMG23.jpeg
```

为了保护系统文件macos的app产生的文件会附带有“@”标志，表示该文件具有扩展属性。还有的会附带“+”标志，

使用命令`xattr -l img/WechatIMG23.jpeg`可查看扩展属性，存储格式为：`name:value`。  
```bash
com.apple.metadata:_kMDItemUserTags:0000000...（省略部分）
com.apple.quarantine: 0082;5e9fbabe;WeChat;
```
若要删除“@”标记，则需要使用命令`xattr -d name file`删除扩展属性
```bash
xattr -d com.apple.metadata:_kMDItemUserTags img/WechatIMG23.jpeg
xattr -d com.apple.quarantine img/WechatIMG23.jpeg
```


参考  
- [mac-xattr](https://unix.stackexchange.com/questions/1646/or-mark-after-running-ls-al)