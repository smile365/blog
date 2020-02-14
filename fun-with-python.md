---
title:  学 Python 都用来干嘛的？
heading: 
date: 2020-02-14T07:39:08.895Z
categories: ["life"]
draft: true
tags: 
description: 
---


3行代码自动发送邮件?

```python
import yagmail
yag = yagmail.SMTP('your@qq.com', '授权码','smtp.qq.com',465)
yag.send(to = 'sxy9103@qq.com', subject = '微信搜索「下课了」试试', contents = ['这是软广', '不对，是硬广。下面是我的靓照','./gaoqing.png'])
```


自动左划右划？

自动发送微博

生成炫酷的朋友圈

自动交易股票？
