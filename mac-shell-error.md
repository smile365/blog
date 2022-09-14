---
title:  mac-shell-error
heading: 
date: 2022-09-14T12:44:47.594Z
categories: ["code"]
tags: 
description: 
---

mac 终端 粘贴复制出现异常字符，前后出现多余字符 00~  01~  command+c  command+v

```bash
printf '\e[?2004l'
```
