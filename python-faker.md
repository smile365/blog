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
fake = Faker()

fake.name()
```



