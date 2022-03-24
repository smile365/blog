---
title:  python-list-to-tree
heading: Python | Convert a list of lists into tree-like dict
date: 2022-03-24T07:54:23.163Z
categories: ["other"]
tags: 
description: 列表转树形结构
---

Python | Convert a list of lists into tree-like dict - 

```python
def listToTree(arr,eid="id",pid="parentId",root="-1",children="children"):
	'''把一个 list 转成 tree
	arr: list 数组
	eid: 哪个字段是自己的 id, 默认为 id
	pid: 哪个字段是父 id, 默认为 parentId 
	root: 哪个值是根, 默认为 "-1"
	children: 
	'''
	groupBy = {}
	for x in arr:
		nlist = groupBy.get(str(x[pid])) or []
		nlist.append(x)
		groupBy[str(x[pid])] = nlist
	for y in arr:
		y[children] = groupBy.get(str(y[eid]))
	return [z for z in arr if str(z[pid])==root]
```
