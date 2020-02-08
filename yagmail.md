---
title:  yagmail使用教程
heading: python发送邮件yagmail使用教程
date: 2020-02-08T02:25:35.614Z
categories: ["life"]
draft: true
tags: 
description: 
---

[yagmail](https://github.com/kootenpv/yagmail)是一个python程序，可以方便的发送gmail邮件，因其包装了smtp协议，因此也可以用来发送第三方邮件。以qq邮箱为例：


第一步：登录邮箱-->设置-->账户-->开启SMTP服务。

第二步：点击生成授权码，生成一个机器登录的密码。

发送邮件的代码如下：

```python
import yagmail
yag = yagmail.SMTP('931918906@qq.com', '你的授权码','smtp.qq.com',465)

subject = '如何循序渐进的学习JavaScript'
body = ''' 
书籍列表：
高性能JavaScript_编程.pdf
JavaScript_DOM编程艺术_第2版.pdf
JavaScript高级程序设计_第3版.pdf
JavaScript高级程序设计（第3版）】中文 高清 完整 详细书签版.pdf
JavaScript语言精粹（修订版）.pdf

更多技术相关文章可以到我的博客查看，<a href="https://sxy91.com/">宋洋葱的博客</a>

关注我的公众号<a href="https://mp.weixin.qq.com/s/Cw1Pjc4sR-xVF4uPlp541w">「下课了」</a>可以查看投资理财、职场技能能文章。

'''
# 发送附件
file = './js学习pdf书籍.zip'

def send_email(to):
	yag.send(to = to, subject = subject, contents = [body, file])


to = 'sxy9103@qq.com'
send_email(to)
```

