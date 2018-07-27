---
title:  url正则
date: 2018-07-27T02:05:03.386Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
cover: 
---

网络标准RFC 1738规定：
“只有字母和数字[0-9a-zA-Z]、一些特殊符号“$-_.+!*'(),”[不包括双引号]、以及某些保留字，才可以不经过编码直接用于URL。”

`(https?://)?([-\w]+\.)+[-\w]+(/[-\w\.'&=+$#%]+)*`

参考
- [正则表达式](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Regular_Expressions)
- [关于URL编码](http://www.ruanyifeng.com/blog/2010/02/url_encoding.html)
- [百分号编码](https://zh.wikipedia.org/wiki/%E7%99%BE%E5%88%86%E5%8F%B7%E7%BC%96%E7%A0%81)
