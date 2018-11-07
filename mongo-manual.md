---
title:  mongo常用
date: 2018-11-07T07:37:22.875Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

mongo 更改列名
```javascript
db.students.updateMany( {}, { $rename: { "nmae": "name" } } )
```
参考[$rename](https://docs.mongodb.com/manual/reference/operator/update/rename/)

