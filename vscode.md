---
title:  vscode入门教程
heading:
date: 2019-12-04T08:13:10.397Z
draft: true
categories: ["code","life","tools","read"]
tags: 
description: 
---

创建python模板

```json
{
	"python file": {
		"scope": "python",
		"prefix": "py",
		"body": [
			"#!/usr/bin/env python",
			"# -*- coding: utf-8 -*-",
			"# @Date    : ${CURRENT_YEAR}-${CURRENT_MONTH}-${CURRENT_DATE} ${CURRENT_HOUR}:${CURRENT_MINUTE}:${CURRENT_SECOND} ",
			"# @Author  : songxueyan (sxy9103@gmail.com)",
			"# @Link    : https://sxy91.com",
			"# @Description : ",
			"",
			"$1",
		],
		"description": "new python file"
	}
}
```

参考  

- [vscode的代码片段](https://code.visualstudio.com/docs/editor/userdefinedsnippets)