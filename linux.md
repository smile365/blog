---
title:  Linux
date: 2019-05-19T13:28:17.845Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

查看Linux发行版信息
ls /etc/*release

利用grep/awk/sed命令从文件中提取特定内容

举例1
一行一个json，把uid提取到另一个文件


- grep：打印匹配的行，类似于 `awk '/reger/print'`
- awk：`'/pattern/ action'` 使用`pattern` 按行进行`pattern`匹配，匹配成功则执行`action`
- sed：行编辑器

打`uid`所在的行号

`sed -n  -e '/uid/=' book.json`

统计文件的行数

`wc -l book.txt`


参考  

- [awk-filter](https://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/)