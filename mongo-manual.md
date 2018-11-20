---
title:  mongo常用
date: 2018-11-07T07:37:22.875Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

创建索引[createIndex](http://www.runoob.com/mongodb/mongodb-indexing.html)
```javascript
db.values.createIndex({open: 1, close: 1}, {background: true})
```

mongo更改列名[$rename](https://docs.mongodb.com/manual/reference/operator/update/rename/)
```javascript
db.students.updateMany( {}, { $rename: { "nmae": "name" } } )
```


group
```
db.user.aggregate([{$group : {_id : "$date", total : {$sum : 1}}}])
```