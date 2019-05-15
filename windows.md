---
title:  windows使用技巧
date: 2018-07-20T09:32:38.774Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---


类似于Linux 下的grep
C:\> dir /B | findstr /R /C:"[mp]"

查看端口占用
netstat -ano | findstr 8009

新建一个批处理如：aliase.bat，双击运行。
```bat
@doskey ls=dir /b $*
@doskey st="C:\Program Files\Sublime Text 3\sublime_text.exe $*"
```

关机后下次需要重新运行一次，可以加到开机启动，新建一个hotkey.reg,双击运行。
```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Command Processor]
"AutoRun"="D://sxycmd//aliase.bat"
```




参考  
- [Windows-alias给cmd命令起别名](https://www.awaimai.com/2445.html)
- [windows-alias](https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt)