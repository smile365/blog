---
title: python 使用 faker 自动生成假数据和测试数据
heading: 
date: 2021-01-20T02:37:09.448Z
categories: ["code"]
tags: 
description: python-faker
---

[faker](https://faker.readthedocs.io/en/master/)可以生成非常真实的随机数据，通过它的[提供者](https://faker.readthedocs.io/en/master/providers.html)，可以生成诸如姓名、地址、ip、公司名、银行卡号、邮编、ISBN、时间、手机号、职业等等数据。通过本地话配置可支持设置不同的语言和地区。

安装

```bash
pip install faker
```

使用

```python
from faker import Faker
# 设置语言
fake = Faker('zh_CN')

print(fake.name())
print(fake.random_int(0, 100))
print(fake.random_number(digits=10))

print(fake.lexify(text='测试字符串：????', letters='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'))
```



也可以使用 [mimesis](https://github.com/lk-geimfari/mimesis)




参考文档
- [假数据 3 种方法](https://blog.csdn.net/pythonxiaopeng/article/details/109026484)