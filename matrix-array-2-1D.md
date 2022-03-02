---
title: python任意多维数组转一维数组
heading: 
date: 2022-02-15T08:53:50.545Z
categories: ["code"]
tags: 
description: Convert Matrix / 2D Array to a 1D,matrix-array-2-1D
---

项目中需要把多维数据转变成一维数组，看了下网上的方法不太完美，所以自己使用递归实现了一个小方法，记录下。

python 实现
```python
def multArr2one(arr):
	res = []
	for x in arr:
		if isinstance(x,list):
			res += multArr2one(x)
		else:
			res.append(x)
	return res
```

JavaScript 实现
```javascript
function multArr2one(arr){
	res = []
	for (let x of arr){
		Array.isArray(x) ? res = res.concat(multArr2one(x)) : res.push(x);
	}	
	return res	
}
```

[网上的方法](https://leejason.blog.csdn.net/article/details/106928360)不满足我的需求
举例：
```python
# 不支持字符串
import operator
from functools import reduce
print(reduce(operator.add, [[1,2,3], [4,5], [6]])) # OK
print(reduce(operator.add, ["abc"])) # "abc",str
print(reduce(operator.add, ["a","bc"])) # "abc",str

```


